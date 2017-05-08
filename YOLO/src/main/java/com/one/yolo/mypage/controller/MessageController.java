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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.yolo.common.PaginationInfo;
import com.one.yolo.common.SearchVO;
import com.one.yolo.common.Utility;
import com.one.yolo.follow.model.FollowService;
import com.one.yolo.follow.model.FollowVO;
import com.one.yolo.member.model.MemberService;
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
	@Autowired
	private MemberService memberService;
	@Autowired
	private FollowService followService;
	@RequestMapping("/messageSend.do")
	public String messageSend(){
		logger.info("messageSend 화면 보여주기");
		
		return "mypage/message/messageSend";
	}
	@RequestMapping("/sendbox.do")
	public String sendbox(@ModelAttribute SearchVO searchVO,HttpSession session, Model model){
		//세션에 저장
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

				int totalRecord =messageService.selectTotalRecordSend(searchVO);
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
	public String getbox(@ModelAttribute SearchVO searchVO,HttpSession session, Model model){
		//세션에 저장
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

		int totalRecord =messageService.selectTotalRecordGet(searchVO);
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
	@Transactional
	public String insertMessage(@ModelAttribute MessageVO messageVo,
			@ModelAttribute MessageMagaVO messageMagaVo,Model model,HttpSession session){
		//세션에 저장
		String userid =(String)session.getAttribute("userid");
		messageVo.setMsUserid(userid);
		
		String[] array = messageVo.getMsgUserid().split(","); 
		logger.info("쪽지보내기 처리, 파라미터 messageVo={},messageMagaVo={}", messageVo,messageMagaVo);
		int cnt =0;
		for (int i = 0; i < array.length; i++) {   	
			messageVo.setMsgUserid(array[i]);
			cnt += messageService.insertSend(messageVo, messageMagaVo);
			logger.info("쪽지보내기 등록 cnt={}", cnt);
		}
		
		
		String msg="",url="/mypage/message/messageSend.do";
		if(cnt==array.length){
			msg="보내기 성공";
		}else{
			msg="보내기 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	
	@RequestMapping("/idSelect.do")
	public String idSelect(HttpSession session,Model model){
		String userid =(String)session.getAttribute("userid");
		logger.info("idSelect 화면 보여주기 userid={}",userid);
		List<FollowVO> alist = followService.selectFollow(userid);
		logger.info("follow 조회 결과, alist.size()={}", alist.size());
		
		model.addAttribute("flList",alist);
		
		return "mypage/message/idSelect";
	}
	
	@RequestMapping("/ajaxCheckId.do")
	@ResponseBody
	public Boolean ajaxCheckId(@RequestParam String msgUserid){
		logger.info("ajax-아이디 중복확인,파라미터 msgUserid={}",msgUserid);
		 
	    String[] array = msgUserid.split(",");     //콤마 구분자로 배열에 ktype저장
	    for (int i = 0; i < array.length; i++) {
		}
	    int[] result=new int[array.length];
	    for (int i = 0; i < array.length; i++) {   	
	    	result[i]= memberService.duplicateUserid(array[i]);   
		}
	   
		Boolean bool=false;
		int cnt=0;
		for (int i = 0; i < result.length; i++) {
			if(result[i]==memberService.EXIST_ID){
				//아이디가 이미 존재하는 경우
				cnt+=1;
			}
		}
		if(cnt==result.length){
			bool=true;
		}
		
		
		return bool;
		
	}
	
	@RequestMapping("/messageCheck.do")
	@ResponseBody
	public int messageCheck(@RequestParam int msNo){
		logger.info("메세지 상태 업데이트,파라미터 msNo={}",msNo);
		 
	    int cnt=messageService.messageCheck(msNo);
		
		return cnt;
		
	}
	
}
