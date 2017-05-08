package com.one.yolo.message.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.one.yolo.common.SearchVO;

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
	@Override
	public List<Map<String, Object>> selectMessageSend(SearchVO searchVO) {
		return getSqlSession().selectList(namespace+".selectMessageSend",searchVO);
	}

	@Override
	public int selectTotalRecordSend(SearchVO searchVo) {
		return getSqlSession().selectOne(namespace
				+".selectTotalRecordSend", searchVo);
	}
	
	@Override
	public int selectTotalRecordGet(SearchVO searchVo) {
		return getSqlSession().selectOne(namespace
				+".selectTotalRecordGet", searchVo);
	}

	@Override
	public int deleteMessageMaga(int msNo) {
		return getSqlSession().delete(namespace+".deleteMessageMaga",msNo);
	}
	@Override
	public int deleteMessage(int msNo) {
		return getSqlSession().delete(namespace+".deleteMessage",msNo);
	}

	@Override
	public List<Map<String, Object>> selectMessageGet(SearchVO searchVO) {
		return getSqlSession().selectList(namespace+".selectMessageGet",searchVO);
	}

	@Override
	public int messageCheck(int msNo) {
		return getSqlSession().update(namespace+".messageCheck",msNo);
	}

	

}
