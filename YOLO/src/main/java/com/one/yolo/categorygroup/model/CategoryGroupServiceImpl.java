package com.one.yolo.categorygroup.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryGroupServiceImpl implements CategoryGroupService{
	
	@Autowired
	private CategoryGroupDAO dao;
	
	public List<CategoryGroupVO> selectAll(){
		return dao.selectAll();
	}
}
