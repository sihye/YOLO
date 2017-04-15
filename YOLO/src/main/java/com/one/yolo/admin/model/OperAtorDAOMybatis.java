package com.one.yolo.admin.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;


@Repository
public class OperAtorDAOMybatis extends SqlSessionDaoSupport implements OperAtorDAO{
	
	private String namespace="config.mybatis.mapper.oracle.operator";

	@Override
	public int insertOperAtor(OperAtorVO vo) {
		return getSqlSession().insert(namespace+".insertOperAtor",vo);
	}

	@Override
	public List<Map<String, Object>> selectJoin() {
		return getSqlSession().selectList(namespace+".opSelectJoin");
	}

	@Override
	public int delupdate(int op_no) {
		return getSqlSession().update(namespace+".delUpdateOperAtor",op_no);
	}

	@Override
	public OperAtorVO selectByNo(int op_no) {
		return getSqlSession().selectOne(namespace+".selectByNo",op_no);
	}

	@Override
	public Map<String, Object> opjoinSelectByOpno(int no) {
		return getSqlSession().selectOne(namespace+".opjoinSelectByOpno",no);
	}
	
	
	
	
	
	
	
	
	
}
