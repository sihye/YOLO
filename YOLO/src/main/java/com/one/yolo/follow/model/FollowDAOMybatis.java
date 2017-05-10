package com.one.yolo.follow.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.one.yolo.common.SearchVO;

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

	@Override
	public List<Map<String, Object>> selectFollowClass(SearchVO searchVO) {
		return getSqlSession().selectList(namespace+".selectFollowClass",searchVO);
	}
	
	public int selectTotalRecord(SearchVO searchVo){
		return getSqlSession().selectOne(namespace
				+".selectTotalRecord", searchVo);
	}

	@Override
	public int insertFollow(FollowVO followVo) {
		return getSqlSession().insert(namespace+".insertFollow",followVo);
	}

	@Override
	public int selectFollowCount(FollowVO followVo) {
		return getSqlSession().selectOne(namespace+".selectFollowCount",followVo);
	}

}
