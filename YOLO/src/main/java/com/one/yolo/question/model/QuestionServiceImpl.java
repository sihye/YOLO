package com.one.yolo.question.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QuestionServiceImpl implements QuestionService{
	
	@Autowired
	private QuestionDAO dao;
	
	public List<QuestionVO> selectAll(){
		return dao.selectAll();
	}
}
