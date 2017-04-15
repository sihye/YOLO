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
	
		return getSqlSession().insert(namespace+".insertUpfile",vo);
	}


	@Override
	public UpfileVO selectByFno(int no) {
		return getSqlSession().selectOne(namespace+".selectByFno",no);
	}


	@Override
	public int deleteByFno(int no) {
		return getSqlSession().delete(namespace+".delectByFno",no);
	}
	
	
	
}
