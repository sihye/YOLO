package com.one.yolo.mypage.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
@Repository
public class HostClassDAOMybatis extends SqlSessionDaoSupport implements HostClassDAO{
	private String nameSpace="config.mybatis.mapper.oracle.hostClass";

	@Override
	public List<Map<String, Object>> selClaForHost(String userid) {
		return getSqlSession().selectList(nameSpace+".selClaForHost", userid);
	}
}
