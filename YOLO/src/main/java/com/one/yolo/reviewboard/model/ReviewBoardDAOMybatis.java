package com.one.yolo.reviewboard.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.one.yolo.common.SearchVO;

@Repository
public class ReviewBoardDAOMybatis extends SqlSessionDaoSupport implements ReviewBoardDAO {
	
	private String namespace="config.mybatis.mapper.oracle.reviewboard";
	
	public List<Map<String, Object>> selectReviewBoard(SearchVO searchVO){
		return getSqlSession().selectList(namespace+".selectReviewBoard",searchVO);
	}
}
