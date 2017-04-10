package com.one.yolo.member.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class MemberDAOMybatis extends SqlSessionDaoSupport implements MemberDAO{
	
	private String namespace="config.mybatis.mapper.oracle.member";

	@Override
	public int memberInsert(MemberVO vo) {
		return getSqlSession().insert(namespace+".memberInsert", vo);
	}

	@Override
	public int duplicateUserid(String userid) {
		return getSqlSession().selectOne(namespace+".duplicateUserid", userid);
	}

	@Override
	public String selectPwd(String userid) {
		return getSqlSession().selectOne(namespace+".selectPwdByUserid", userid);
	}

	@Override
	public MemberVO selectByUserid(String userid) {
		return getSqlSession().selectOne(namespace+".selectByUserid", userid);
	}
	
}
