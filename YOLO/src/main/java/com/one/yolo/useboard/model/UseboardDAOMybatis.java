package com.one.yolo.useboard.model;

import java.util.List;


import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.one.yolo.common.SearchVO;

@Repository
public class UseboardDAOMybatis extends SqlSessionDaoSupport 
	implements UseboardDAO{
	
	private String namespace="config.mybatis.mapper.oracle.useboard";
	
	@Override
	public List<UseboardVO> selectUseboard(SearchVO searchVo){
		return getSqlSession().selectList(namespace+".selectUse", searchVo);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return getSqlSession().selectOne(namespace+".selectTotalRecord", searchVo);
	}
	
	@Override
	public int insertUseboard(UseboardVO vo){
		return getSqlSession().insert(namespace+".insertUseboard", vo);
	}
	
	@Override
	public UseboardVO selectNo(int no){
		return getSqlSession().selectOne(namespace+".selectNo", no);
	}
	
	@Override
	public int updateReadCount(int no){
		return getSqlSession().update(namespace+".updateReadCount", no);
	}

	@Override
	public int updateUse(UseboardVO vo) {
		return getSqlSession().update(namespace+".updateUse", vo);
	}

	@Override
	public int deleteUseboard(int no) {
		return getSqlSession().update(namespace+".deleteUseboard", no);
	}



	


	
}
