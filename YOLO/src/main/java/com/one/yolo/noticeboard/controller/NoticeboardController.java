package com.one.yolo.noticeboard.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.one.yolo.common.PaginationInfo;
import com.one.yolo.common.Utility;
import com.one.yolo.common.SearchVO;
import com.one.yolo.noticeboard.model.NoticeboardService;
import com.one.yolo.noticeboard.model.NoticeboardVO;

@Controller
@RequestMapping(value="/noticeboard")
public class NoticeboardController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeboardController.class);

	
	@Autowired
	private NoticeboardService noticeboardService;
	
	@RequestMapping("/list.do")
	public String noticeboardlist(@ModelAttribute SearchVO searchVo, Model model){
		/*logger.info("noticeboardlist화면목록 ");*/
		logger.info("noticeboardlist화면목록  searchVo={}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		/*List<NoticeboardVO> nList = noticeboardService.selectNoticeboard();*/
		List<NoticeboardVO> nList = noticeboardService.selectNoticeboard(searchVo);
		logger.info("조회 결과 nList.size()={}", nList.size());
		logger.info("조회 결과 nList={}", nList);
		
		int totalRecord =noticeboardService.selectTotalRecord(searchVo);
		logger.info("조회 전체레코드 개수조회 결과, totalRecord={}",
				totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("nList",nList);
		model.addAttribute("pagingInfo",pagingInfo);
		
		return "noticeboard/list";
	}
	
	@RequestMapping(value="write.do", method=RequestMethod.GET)
	public String write_get(){
		logger.info("공지사항 글쓰기 화면 보여주기");

		return "noticeboard/write";
	}
	
	@RequestMapping(value="write.do", method=RequestMethod.POST)
	public String write_post(@ModelAttribute NoticeboardVO vo){
		logger.info("공지사항 글쓰기 처리, 파라미터 NoticeboardVO={}", vo);
		
		int cnt = noticeboardService.insertNoticboard(vo);
		logger.info("공지사항 글쓰기 결과 cnt={}",cnt);
		
		return "redirect:/noticeboard/list.do";		
	}
	
	@RequestMapping(value="updateCount.do")
	public String updateCount(
			@RequestParam(value="no", defaultValue="0")
			int no, Model model){
		logger.info("조회수 증가, 파라미터 no={}",no);
		if(no==0){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/noticeboard/list.do");
			
			return "common/message";
		}
		
		int cnt = noticeboardService.updateReadCount(no);
		logger.info("조회수 증가 결과, cnt={}", cnt);
		
		return "redirect:/noticeboard/detail.do?no="+no;
	}
	
	
	
	@RequestMapping(value="detail.do")
	public String detail(@RequestParam
			(value="no", defaultValue="0") int no, 
			Model model){
		logger.info("공지사항 글 상세보기, 파라미터 no={}",no);
		if(no==0){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/noticeboard/list.do");
			
			return "common/message";
		}
		
		NoticeboardVO vo = noticeboardService.selectNo(no);
		logger.info("공지사항 상세보기 vo={}",vo);
		
		model.addAttribute("vo",vo);
		
		return "noticeboard/detail";
		
	}
	
	@RequestMapping(value="edit.do", method=RequestMethod.GET)
	public String edit_get(@RequestParam (value="no", defaultValue="0") int no,
			Model model){
		logger.info("공지사항 수정화면, 파라미터no={}", no );
		if(no==0){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/noticeboard/detail.do");
			
			return "common/message";
		}
		
		NoticeboardVO vo = noticeboardService.selectNo(no);
		logger.info("수정화면 vo={}",vo);
		
		model.addAttribute("vo",vo);
		
		return "noticeboard/edit";
	}
	
	@RequestMapping(value="edit.do", method=RequestMethod.POST)
	public String edit_post(@ModelAttribute NoticeboardVO vo, 
			Model model){
		logger.info("공지사항 수정 처리, 파라미터 vo={}", vo);
		String msg="", url="";
			
		int cnt = noticeboardService.updateNotice(vo);
		logger.info("공지사항 수정 결과 cnt={}", cnt);

		if(cnt>0){
			msg="공지사항 수정 성공";
			url="/noticeboard/detail.do?no="+vo.getNbNo();
		}else{
			msg="공지사항 수정 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value="delete.do", method=RequestMethod.GET)
	public String delete_get(
			@RequestParam(value="no", defaultValue="0") int no,
			Model model){
		logger.info("삭제화면, 파라미터 no={}", no);
		
		if(no==0){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/noticeoard/list.do");
			
			return "common/message";
		}
		
		return "noticeboard/delete";
	
	}
	
	@RequestMapping(value="/delete.do", method=RequestMethod.POST)
	public String delete_post(@RequestParam (value="no", defaultValue="0") int no, 
			Model model){
		
		logger.info("글 삭제 처리, 파라미터 no={}", no);
		
		String msg="", url="/noticeboard/delete.do?no="+no;
		
		int cnt = noticeboardService.deleteNoticeoard(no);			
		logger.info("글삭제 cnt={}", cnt);
		
		msg="글 삭제 성공";
		url="/noticeboard/list.do";
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";		
	}
	
	
	
	
	
	
	
	
	
	
}
