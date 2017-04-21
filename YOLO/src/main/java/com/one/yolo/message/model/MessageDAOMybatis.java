package com.one.yolo.message.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAOMybatis extends SqlSessionDaoSupport implements MessageDAO {
	private String namespace="config.mybatis.mapper.oracle.message";
	
	@Override
	public int insertMessage(MessageVO messageVo) {
		return getSqlSession().insert(namespace+(".insertMessage"),messageVo);
	}

	@Override
	public int insertMessageMaga(MessageMagaVO messageMageVo) {
		return getSqlSession().insert(namespace+(".insertMessageMaga"),messageMageVo);
	}

}
