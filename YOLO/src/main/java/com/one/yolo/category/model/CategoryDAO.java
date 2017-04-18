package com.one.yolo.category.model;

import java.util.List;

public interface CategoryDAO {
	public List<CategoryVO> selectAll();
	
	public List<CategoryVO> selectCateAll();
	public List<CategoryGroupVO> selCateGroupAll();
	public List<CategoryVO> selCateByCateGroup();
}
