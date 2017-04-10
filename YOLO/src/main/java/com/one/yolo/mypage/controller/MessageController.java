package com.one.yolo.mypage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage/message")
public class MessageController {
	private static final Logger logger
	=LoggerFactory.getLogger(MessageController.class);
	
	@RequestMapping("/messageSend.do")
	public String messageSend(){
		logger.info("messageSend 화면 보여주기");
		
		return "mypage/message/messageSend";
	}
	@RequestMapping("/messageCheck.do")
	public String messageCheck(){
		logger.info("messageCheck 화면 보여주기");
		
		return "mypage/message/messageCheck";
	}
}
