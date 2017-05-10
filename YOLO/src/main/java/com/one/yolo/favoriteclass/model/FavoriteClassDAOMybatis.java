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

	@Override
	public int deleteNoFavoriteClass(int no) {
		return getSqlSession().delete(namespace+".deleteNoFavoriteClass",no);
	}
	
	@Override
	public int deleteIdFavoriteClass(String userid) {
		return getSqlSession().delete(namespace+".deleteIdFavoriteClass",userid);
	}

	@Override
	public int favoriteclassinsert(FavoriteClassVO frclassVo) {
		return getSqlSession().insert(namespace+".favoriteclassinsert",frclassVo);
	}

	@Override
	public List<FavoriteClassVO> selectShoppingbasket(String userid) {
		return getSqlSession().selectList(namespace+".selectShoppingbasket",userid);
	}

	@Override
	public int selectsbCount(FavoriteClassVO faclassVo) {
		return getSqlSession().selectOne(namespace+".selectsbCount",faclassVo);
	}

}
