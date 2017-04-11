package com.one.yolo.category.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDAOMybatis extends SqlSessionDaoSupport  implements CategoryDAO{
	
	private String namespace="config.mybatis.mapper.oracle.category";

	
	public List<CategoryVO> selectAll() {
		return getSqlSession().selectList(namespace+".selectCategoryAll");
	}
	
	
}
