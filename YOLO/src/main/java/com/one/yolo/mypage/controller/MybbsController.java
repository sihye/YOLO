package com.one.yolo.mypage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage/Mybbs")
public class MybbsController {
	private static final Logger logger
	=LoggerFactory.getLogger(MybbsController.class);
	
	@RequestMapping("/qnaboard.do")
	public String qnaboard(){
		logger.info("qnaboard 화면 보여주기");
		
		return "mypage/Mybbs/qnaboard";
	}
	@RequestMapping("/reviewboard.do")
	public String reviewboard(){
		logger.info("reviewboard 화면 보여주기");
		
		return "mypage/Mybbs/reviewboard";
	}
}
