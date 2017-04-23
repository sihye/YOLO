package com.one.yolo.mypage.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.yolo.common.PaginationInfo;
import com.one.yolo.common.SearchVO;
import com.one.yolo.common.Utility;
import com.one.yolo.message.model.MessageMagaVO;
import com.one.yolo.message.model.MessageListVO;
import com.one.yolo.message.model.MessageMagaListVO;
import com.one.yolo.message.model.MessageService;
import com.one.yolo.message.model.MessageVO;


@Controller
@RequestMapping("/mypage/message")
public class MessageController {
	private static final Logger logger
	=LoggerFactory.getLogger(MessageController.class);
	@Autowired
	private MessageService messageService;
	
	@RequestMapping("/messageSend.do")
	public String messageSend(){
		logger.info("messageSend 화면 보여주기");
		
		return "mypage/message/messageSend";
	}
	@RequestMapping("/sendbox.do")
	public String sendbox(@ModelAttribute SearchVO searchVO,HttpServletRequest request, Model model){
		//세션에 저장
				HttpSession session = request.getSession();
				session.setAttribute("userid", "hong");
				String userid =(String)session.getAttribute("userid");
				searchVO.setUserid(userid);
				logger.info("sendbox 화면 보여주기 ,파라미터 searchVO={}",searchVO);
				//[1] PaginationInfo 객체 생성 
				//=> firstRecordIndex 를 계산하기 위함
				PaginationInfo pagingInfo = new PaginationInfo();
				pagingInfo.setBlockSize(Utility.BLOCKSIZE);
				pagingInfo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
				pagingInfo.setCurrentPage(searchVO.getCurrentPage());

				//[2] SearchVO 값 셋팅
				searchVO.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
				searchVO.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

				List<Map<String, Object>> alist = messageService.selectMessageSend(searchVO);
				logger.info("보낸쪽지함 조회 결과 alist.size()={}",alist.size());

				int totalRecord =messageService.selectTotalRecord(searchVO);
				logger.info("보낸쪽지함 조회-전체레코드 개수조회 결과, totalRecord={}",			
						totalRecord);

				pagingInfo.setTotalRecord(totalRecord);

				model.addAttribute("alist",alist);
				model.addAttribute("pagingInfo", pagingInfo);
		
		return "mypage/message/sendbox";
	}
	@RequestMapping("/deleteMultiSend.do")
	public String deleteMultiSend(@ModelAttribute MessageMagaListVO msmgListVo,
			HttpServletRequest request,	Model model){
		logger.info("선택한 쪽지 삭제, 파라미터 msmgListVo={}", msmgListVo);
		
		List<MessageMagaVO> msmgList =msmgListVo.getMsmgItems();
		int cnt = messageService.deleteMultiSend(msmgList);
		logger.info("선택한 쪽지 삭제 결과, cnt={}", cnt);
		
		String msg="", url="/mypage/message/sendbox.do";
		if(cnt>0){
			for(int i=0;i<msmgList.size();i++){
				MessageMagaVO vo =msmgList.get(i);
				logger.info("vo={}", vo);
						
			}//for
			msg="선택한 쪽지 삭제가 완료되었습니다.";
		}else{
			msg="선택한 쪽지 삭제중 에러가 발생했습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/getbox.do")
	public String getbox(@ModelAttribute SearchVO searchVO,HttpServletRequest request, Model model){
		//세션에 저장
		HttpSession session = request.getSession();
		session.setAttribute("userid", "hong");
		String userid =(String)session.getAttribute("userid");
		searchVO.setUserid(userid);
		logger.info("getbox 화면 보여주기 ,파라미터 searchVO={}",searchVO);
		//[1] PaginationInfo 객체 생성 
		//=> firstRecordIndex 를 계산하기 위함
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVO.getCurrentPage());

		//[2] SearchVO 값 셋팅
		searchVO.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		searchVO.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		List<Map<String, Object>> alist = messageService.selectMessageGet(searchVO);
		logger.info("받은쪽지함 조회 결과 alist.size()={}",alist.size());

		int totalRecord =messageService.selectTotalRecord(searchVO);
		logger.info("받은쪽지함 조회-전체레코드 개수조회 결과, totalRecord={}",			
				totalRecord);

		pagingInfo.setTotalRecord(totalRecord);

		model.addAttribute("alist",alist);
		model.addAttribute("pagingInfo", pagingInfo);

		
		return "mypage/message/getbox";
	}
	
	@RequestMapping("/deleteMultiGet.do")
	public String deleteMultiGet(@ModelAttribute MessageListVO msListVo,
			HttpServletRequest request,	Model model){
		logger.info("선택한 쪽지 삭제, 파라미터 msListVo={}", msListVo);
		
		List<MessageVO> msList =msListVo.getMsItems();
		int cnt = messageService.deleteMultiGet(msList);
		logger.info("선택한 쪽지 삭제 결과, cnt={}", cnt);
		
		String msg="", url="/mypage/message/getbox.do";
		if(cnt>0){
			for(int i=0;i<msList.size();i++){
				MessageVO vo =msList.get(i);
				logger.info("vo={}", vo);
						
			}//for
			msg="선택한 쪽지 삭제가 완료되었습니다.";
		}else{
			msg="선택한 쪽지 삭제중 에러가 발생했습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	@RequestMapping("/insertMessage.do")
	public String insertMessage(@ModelAttribute MessageVO messageVo,
			@ModelAttribute MessageMagaVO messageMagaVo,Model model,HttpServletRequest request){
		//세션에 저장
		HttpSession session = request.getSession();
		session.setAttribute("userid", "hong");
		String userid =(String)session.getAttribute("userid");
		messageVo.setMsUserid(userid);
		
		logger.info("쪽지보내기 처리, 파라미터 messageVo={},messageMagaVo={}", messageVo,messageMagaVo);
		int cnt = messageService.insertSend(messageVo, messageMagaVo);
		logger.info("쪽지보내기 등록 cnt={}", cnt);
		
		String msg="",url="/mypage/message/messageSend.do";
		if(cnt!=0){
			msg="보내기 성공";
		}else{
			msg="보내기 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	@RequestMapping("/idSelect.do")
	public String idSelect(){
		logger.info("idSelect 화면 보여주기");
		
		return "mypage/message/idSelect";
	}
}
