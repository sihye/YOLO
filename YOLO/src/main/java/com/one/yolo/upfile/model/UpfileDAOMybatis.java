package com.one.yolo.upfile.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;


@Repository
public class UpfileDAOMybatis extends SqlSessionDaoSupport implements UpfileDAO{
	
	private String namespace="config.mybatis.mapper.oracle.upfile";
	@Override
	public UpfileVO selectByOname(String fileName) {
		System.out.println("onameselect~~~~~");
		return getSqlSession().selectOne(namespace+".selectByOname",fileName);
	}
	
	
	@Override
	public int insertUpfile(UpfileVO vo) {
		System.out.println("upfilevo 실행됬수다!!!!!!!!!!!");
		return getSqlSession().insert(namespace+".insertUpfile",vo);
	}

	
}
