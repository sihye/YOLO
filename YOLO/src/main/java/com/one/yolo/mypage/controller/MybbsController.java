package com.one.yolo.mypage.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.yolo.qnaboard.model.QnaBoardService;

@Controller
@RequestMapping("/mypage/Mybbs")
public class MybbsController {
	private static final Logger logger
	=LoggerFactory.getLogger(MybbsController.class);
	
	@Autowired
	private QnaBoardService qnaboardService;
	
	@RequestMapping("/qnaboard.do")
	public String qnaboard(Model model){
		logger.info("qnaboard 화면 보여주기");
		
		List<Map<String, Object>> alist = qnaboardService.selectQnaBoard();
		logger.info("게시판 조회 결과 alist.size()={}",alist.size());
		
		model.addAttribute("alist",alist);
		return "mypage/Mybbs/qnaboard";
	}
	@RequestMapping("/reviewboard.do")
	public String reviewboard(){
		logger.info("reviewboard 화면 보여주기");
		
		return "mypage/Mybbs/reviewboard";
	}
}
