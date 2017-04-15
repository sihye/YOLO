package com.one.yolo.question.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.yolo.question.model.QuestionService;
import com.one.yolo.question.model.QuestionVO;

@Controller
@RequestMapping("/question")
public class QuestionController {
	private static final Logger logger
	=LoggerFactory.getLogger(QuestionController.class);
	
	@Autowired
	private QuestionService questionService;
	
	@RequestMapping("questionList.do")
	public String qList(Model model){
		
		logger.info("질문 목록 조회");
		
		List<QuestionVO> qList
		=questionService.selectAll();
		logger.info("질문 조회 결과, qList.size()={}", qList.size());
		
		model.addAttribute("qList", qList);
		
		return "inc/questionList";
	}

	
	
}
