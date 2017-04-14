package com.one.yolo.question.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class QuestionDAOMybatis extends SqlSessionDaoSupport implements QuestionDAO{
	
	private String namespace="config.mybatis.mapper.oracle.question";
	
	public List<QuestionVO> selectAll(){
		return getSqlSession().selectList(namespace+".selectQuestion");
	}

}
