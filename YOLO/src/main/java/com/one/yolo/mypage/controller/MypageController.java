package com.one.yolo.mypage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
	private static final Logger logger
	=LoggerFactory.getLogger(MypageController.class);
	
	@RequestMapping("/mypage/mypageindex.do")
	public String index(){
		logger.info("index 화면 보여주기");
		
		return "mypage/mypageindex";
	}
}
