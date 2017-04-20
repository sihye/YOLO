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
	@Override
	public List<CategoryVO> selectCateAll() {
		return dao.selectCateAll();
	}

	@Override
	public List<CategoryGroupVO> selCateGroupAll() {
		return dao.selCateGroupAll();
	}

	@Override
	public List<CategoryVO> selCateByCateGroup() {
		return dao.selCateByCateGroup();
	}
	@Override
	public String selCateNameByNo(int kNo){
		return dao.selCateNameByNo(kNo);
	}
	
}
