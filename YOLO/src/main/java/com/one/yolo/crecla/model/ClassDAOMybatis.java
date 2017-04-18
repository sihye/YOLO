package com.one.yolo.crecla.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
@Repository
public class ClassDAOMybatis extends SqlSessionDaoSupport implements ClassDAO{
	String nameSpace="config.mybatis.mapper.oracle.class";
	@Override
	public int claInsert(ClassVO vo) {
		return getSqlSession().insert(nameSpace+".claInsert",vo);
	}
	@Override
	public ClassVO selClass(int cNo) {
		return getSqlSession().selectOne(nameSpace+".selClass",cNo);
	}

}
