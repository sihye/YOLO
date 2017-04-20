package com.one.yolo.member.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.one.yolo.common.SearchVO;

@Repository
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

	@Override
	public List<MemberVO> MemberselectByAll() {
		
		return getSqlSession().selectList(namespace+".MemberselectByAll");
	}

	@Override
	public List<Map<String, Object>> ExcelMemberView(SearchVO vo) {
		return getSqlSession().selectList(namespace+".ExcelMemberView",vo);
	}

	@Override
	public List<Map<String, Object>> OperatorMemberView() {
		return getSqlSession().selectList(namespace+".OperatorMemberView");
	}

	@Override
	public List<Map<String, Object>> MemberSelectPG(SearchVO vo) {
		
		return getSqlSession().selectList(namespace+".MemberSelectPG",vo);
	}

	@Override
	public int MemberSeletCount(SearchVO vo) {
	
		return getSqlSession().selectOne(namespace+".MemberSeletCount",vo);
	}
	
	
	
	
	
	
	
	
}
