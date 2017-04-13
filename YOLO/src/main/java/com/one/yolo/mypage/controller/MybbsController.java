package com.one.yolo.mypage.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.yolo.common.SearchVO;
import com.one.yolo.qnaboard.model.QnaBoardService;
import com.one.yolo.reviewboard.model.ReviewBoardService;

@Controller
@RequestMapping("/mypage/Mybbs")
public class MybbsController {
	private static final Logger logger
	=LoggerFactory.getLogger(MybbsController.class);
	
	@Autowired
	private QnaBoardService qnaboardService;
	
	@Autowired
	private ReviewBoardService reviewboardService;
	
	@RequestMapping("/qnaboard.do")
	public String qnaboard(@ModelAttribute SearchVO searchVO, Model model){
		
		logger.info("qnaboard 화면 보여주기 ,파라미터 searchVO={}",searchVO);
		
		List<Map<String, Object>> alist = qnaboardService.selectQnaBoard(searchVO);
		logger.info("문의게시판 조회 결과 alist.size()={}",alist.size());
		
		model.addAttribute("alist",alist);
		return "mypage/Mybbs/qnaboard";
	}
	@RequestMapping("/reviewboard.do")
	public String reviewboard(Model model){
		logger.info("reviewboard 화면 보여주기");
		
		List<Map<String, Object>> alist = reviewboardService.selectReviewBoard();
		logger.info("후기게시판 조회 결과 alist.size()={}",alist.size());
		
		model.addAttribute("alist",alist);
		return "mypage/Mybbs/reviewboard";
	}
}
