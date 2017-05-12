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
	public int memberOut(MemberVO vo) {
		return getSqlSession().update(namespace+".memberOut", vo);
	}

	public List<Map<String, Object>> MemberSelectPG(SearchVO vo) {
		
		return getSqlSession().selectList(namespace+".MemberSelectPG",vo);
	}

	@Override
	public int MemberSeletCount(SearchVO vo) {
	
		return getSqlSession().selectOne(namespace+".MemberSeletCount",vo);
	}

	@Override
	public int updateMember(MemberVO vo) {
		
		return getSqlSession().update(namespace+".updateMember",vo);
	}

	@Override
	public List<Map<String, Object>> HostSelectPG(SearchVO vo) {
		return getSqlSession().selectList(namespace+".HostSelectPG",vo);
	}

	@Override
	public int HostSeletCount(SearchVO vo) {
		return getSqlSession().selectOne(namespace+".HostSeletCount",vo);
	}

	public List<Map<String, Object>> HostExcelView(SearchVO vo) {
		return getSqlSession().selectList(namespace+".HostExcelView",vo);
	}

	@Override
	public int hostInsert(MemberVO vo) {
		return getSqlSession().insert(namespace+".hostInsert",vo);
	}

	@Override
	public String findUserid(MemberVO vo) {
		return getSqlSession().selectOne(namespace+".findUserid", vo);
	}

	@Override
	public String findPwd(MemberVO vo) {
		return getSqlSession().selectOne(namespace+".findPwd", vo);
	}

	@Override
	public MemberVO findPwd1(MemberVO vo) {
		return getSqlSession().selectOne(namespace+".findPwd1", vo);
	}

	@Override
	public MemberVO adminLoginCheck(String userid) {
		return getSqlSession().selectOne(namespace+".adminLoginCheck",userid);
	}

	@Override
	public int operatorMemberUpdate(MemberVO vo) {
		return getSqlSession().update(namespace+".operatorMemberUpdate",vo);
	}

	@Override
	public int operatorHostUpdate(MemberVO vo) {
		return getSqlSession().update(namespace+".operatorHostUpdate",vo);
	}

	@Override
	public int hostUpdate(MemberVO vo) {
		// TODO Auto-generated method stub
		return getSqlSession().update(namespace+".hostUpdate", vo);
	}
	
	
	
	
	
	
}
