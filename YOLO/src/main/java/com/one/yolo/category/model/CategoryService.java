package com.one.yolo.category.model;

import java.util.List;

public interface CategoryService {
	public List<CategoryVO> selectAll();
	
	public List<CategoryVO> selectCateAll();
	public List<CategoryGroupVO> selCateGroupAll();
	public List<CategoryVO> selCateByCateGroup();
	public String selCateNameByNo(int kNo);
}
