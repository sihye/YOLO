package com.one.yolo.login.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.one.yolo.member.model.MemberService;

@Controller
@RequestMapping("/login")
public class LoginController {
	private static final Logger logger
	=LoggerFactory.getLogger(LoginController.class);

	@RequestMapping(value="/login.do",method=RequestMethod.GET)
	public String login_get(){
		logger.info("濡쒓렇�씤 �솕硫� 蹂댁뿬二쇨린");
		
		return "login/login";
	}

	
}
