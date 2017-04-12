package com.one.yolo.crecla.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/class")
public class ClaController {
	private static final Logger logger =LoggerFactory.getLogger(ClaController.class);
	@RequestMapping(value="/clacre.do", method=RequestMethod.GET)
	public String showClaCre_get(){
		logger.info("클래스생성페이지 보여주기");
		return "class/creatCalss";
	}
	
}
