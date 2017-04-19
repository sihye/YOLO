package com.one.yolo.boardgroup.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;


@Repository
public class BoardgroupDAOMybatis extends SqlSessionDaoSupport implements BoardgroupDAO{
	
	private String namespace="config.mybatis.mapper.oracle.boardgroup";

	/*@Override
	public int insertBoardgroup(BoardgroupVO vo) {
		return getSqlSession().insert(namespace+".boardgroupinsert",vo);
	}*/

	@Override
	public List<BoardgroupVO> selectBoardgroup() {
		return getSqlSession().selectList(namespace+".selectBoardgroupAll");
	}
	
	
	
	
}
