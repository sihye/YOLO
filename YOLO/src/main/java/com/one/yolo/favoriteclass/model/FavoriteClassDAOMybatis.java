package com.one.yolo.favoriteclass.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.one.yolo.common.SearchVO;

@Repository
public class FavoriteClassDAOMybatis extends SqlSessionDaoSupport implements FavoriteClassDAO {
	private String namespace="config.mybatis.mapper.oracle.favoriteclass";
	
	@Override
	public List<Map<String, Object>> selectFavoriteClass(SearchVO searchVO) {
		return getSqlSession().selectList(namespace+".selectFavoriteClass",searchVO);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return getSqlSession().selectOne(namespace
				+".selectTotalRecord", searchVo);
	}

}
