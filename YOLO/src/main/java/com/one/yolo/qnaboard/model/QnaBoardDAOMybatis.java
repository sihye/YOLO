package com.one.yolo.qnaboard.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class QnaBoardDAOMybatis extends SqlSessionDaoSupport implements QnaBoardDAO {
	private String namespace="config.mybatis.mapper.oracle.qnaboard";
	
	@Override
	public List<Map<String, Object>> selectQnaBoard() {
		return getSqlSession().selectList(namespace+".selectQnaBoard");
	}

}
