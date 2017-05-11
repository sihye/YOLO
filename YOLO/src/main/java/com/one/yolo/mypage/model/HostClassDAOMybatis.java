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

	@Override
	public List<Map<String, Object>> selForStatsGender(int cNo) {
		return getSqlSession().selectList(nameSpace+".selForStatsGender", cNo);
	}

	@Override
	public List<Map<String, Object>> selForStatsAge(int cNo) {
		return getSqlSession().selectList(nameSpace+".selForStatsAge", cNo);
	}

	@Override
	public List<Map<String, Object>> selForStatsSales(String userid) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList(nameSpace+".selForStatsSales", userid);
	}
}
