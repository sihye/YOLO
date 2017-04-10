package com.one.yolo.member.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class MemberDAOMybatis extends SqlSessionDaoSupport implements MemberDAO{
	
	private String namespace="config.mybatis.mapper.oracle.member";

	@Override
	public int memberInsert(MemberVO vo) {
		return getSqlSession().insert(namespace+".memberInsert", vo);
	}
	
}
