package com.one.yolo.qnaboard.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/class")
public class QnaBoardController {
	
	
	private static final Logger logger =LoggerFactory.getLogger(QnaBoardController.class);
	//클래스 qna 페이지 보여주기
		@RequestMapping("/classqna.do")
		public String classqna(){
			logger.info("클래스qna페이지 보여주기");
			
			return "class/classqna";
		}
}
