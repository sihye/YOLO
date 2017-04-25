package com.one.yolo.useboard.controller;

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
import com.one.yolo.useboard.model.UseboardService;
import com.one.yolo.useboard.model.UseboardVO;
import com.one.yolo.common.SearchVO;

@Controller
@RequestMapping(value="/useboard")
public class UseboardController {
	
	private static final Logger logger = LoggerFactory.getLogger(UseboardController.class);

	
	@Autowired
	private UseboardService useboardService;
	
	@RequestMapping("/list.do")
	public String Useboardlist(@ModelAttribute SearchVO searchVo, Model model){
		/*logger.info("Useboardlist화면목록 ");*/
		logger.info("Useboardlist화면목록  searchVo={}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<UseboardVO> uList = useboardService.selectUseboard(searchVo);
		logger.info("조회 결과 uList.size()={}", uList.size());
		logger.info("조회 결과 uList={}", uList);
		
		int totalRecord =useboardService.selectTotalRecord(searchVo);
		logger.info("조회 전체레코드 개수조회 결과, totalRecord={}",
				totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("uList",uList);
		model.addAttribute("pagingInfo",pagingInfo);
		
		return "useboard/list";
	}
	
	@RequestMapping(value="write.do", method=RequestMethod.GET)
	public String write_get(){
		logger.info("공지사항 글쓰기 화면 보여주기");

		return "useboard/write";
	}
	
	@RequestMapping(value="write.do", method=RequestMethod.POST)
	public String write_post(@ModelAttribute UseboardVO vo){
		logger.info("공지사항 글쓰기 처리, 파라미터 UseboardVO={}", vo);
		
		int cnt = useboardService.insertUseboard(vo);
		logger.info("공지사항 글쓰기 결과 cnt={}",cnt);
		
		return "redirect:/useboard/list.do";		
	}
	
	@RequestMapping(value="updateCount.do")
	public String updateCount(
			@RequestParam(value="no", defaultValue="0")
			int no, Model model){
		logger.info("조회수 증가, 파라미터 no={}",no);
		if(no==0){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/useboard/list.do");
			
			return "common/message";
		}
		
		int cnt = useboardService.updateReadCount(no);
		logger.info("조회수 증가 결과, cnt={}", cnt);
		
		return "redirect:/useboard/detail.do?no="+no;
	}
	
	
	
	@RequestMapping(value="detail.do")
	public String detail(@RequestParam
			(value="no", defaultValue="0") int no, 
			Model model){
		logger.info("공지사항 글 상세보기, 파라미터 no={}",no);
		if(no==0){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/useboard/list.do");
			
			return "common/message";
		}
		
		UseboardVO vo = useboardService.selectNo(no);
		logger.info("공지사항 상세보기 vo={}",vo);
		
		model.addAttribute("vo",vo);
		
		return "useboard/detail";
		
	}
	
	@RequestMapping(value="edit.do", method=RequestMethod.GET)
	public String edit_get(@RequestParam (value="no", defaultValue="0") int no,
			Model model){
		logger.info("공지사항 수정화면, 파라미터no={}", no );
		if(no==0){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/useboard/detail.do");
			
			return "common/message";
		}
		
		UseboardVO vo = useboardService.selectNo(no);
		logger.info("수정화면 vo={}",vo);
		
		model.addAttribute("vo",vo);
		
		return "useboard/edit";
	}
	
	@RequestMapping(value="edit.do", method=RequestMethod.POST)
	public String edit_post(@ModelAttribute UseboardVO vo, 
			Model model){
		logger.info("공지사항 수정 처리, 파라미터 vo={}", vo);
		String msg="", url="";
			
		int cnt = useboardService.updateUse(vo);
		logger.info("공지사항 수정 결과 cnt={}", cnt);

		if(cnt>0){
			msg="공지사항 수정 성공";
			url="/useboard/detail.do?no="+vo.getUbNo();
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
			model.addAttribute("url", "/useboard/list.do");
			
			return "common/message";
		}
		
		return "useboard/delete";
	
	}
	
	@RequestMapping(value="/delete.do", method=RequestMethod.POST)
	public String delete_post(@RequestParam (value="no", defaultValue="0") int no, 
			Model model){
		
		logger.info("글 삭제 처리, 파라미터 no={}", no);
		
		String msg="", url="/useboard/delete.do?no="+no;
		
		int cnt = useboardService.deleteUseboard(no);			
		logger.info("글삭제 cnt={}", cnt);
		
		msg="글 삭제 성공";
		url="/useboard/list.do";
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";		
	}
	
	
	
	
	
	
	
	
	
	
}
