package com.one.yolo.mypage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage/MyClass")
public class MyClassController {
		
	private static final Logger logger
	=LoggerFactory.getLogger(MyClassController.class);
	
	@RequestMapping("/HostClass.do")
	public String qnaboard(){
		logger.info("HostClass 화면 보여주기");
		
		return "mypage/MyClass/HostClass";
	}
	@RequestMapping("/PartClass.do")
	public String PartClass(){
		logger.info("PartClass 화면 보여주기");
		
		return "mypage/MyClass/PartClass";
	}
	@RequestMapping("/Payment.do")
	public String Payment(){
		logger.info("Payment 화면 보여주기");
		
		return "mypage/MyClass/Payment";
	}
}






