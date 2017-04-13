package com.one.yolo.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.yolo.member.model.MemberService;



@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger
	=LoggerFactory.getLogger(MemberController.class);

	
	@RequestMapping("/register.do")
	public void register(){
		logger.info("회원가입 화면 보여주기");

	}
}
