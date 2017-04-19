package com.one.yolo.categorygroup.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryGroupDAOMybatis extends SqlSessionDaoSupport implements CategoryGroupDAO{
	
	private String namespace="config.mybatis.mapper.oracle.categorygroup";
	
	public List<CategoryGroupVO> selectAll(){
		return getSqlSession().selectList(namespace+".selectCategoryGroupAll");
	}
}
