package com.one.yolo.category.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDAO dao;

	public List<CategoryVO> selectAll(){
		return dao.selectAll();
	}
	
	
}
