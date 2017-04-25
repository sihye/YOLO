package com.one.yolo.follow.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class FollowDAOMybatis extends SqlSessionDaoSupport implements FollowDAO{
	private String namespace="config.mybatis.mapper.oracle.follow";
	
	@Override
	public List<FollowVO> selectFollow(String userid) {
		return getSqlSession().selectList(namespace+".selectFollow",userid);
	}

	@Override
	public int deleteFollow(int flNo) {
		return getSqlSession().delete(namespace+".deleteFollow",flNo);
	}

}
