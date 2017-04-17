package com.one.yolo.category.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.yolo.category.model.CategoryService;
import com.one.yolo.category.model.CategoryVO;

@Controller
@RequestMapping("/category")
public class CategoryController {
	private static final Logger logger
	=LoggerFactory.getLogger(CategoryController.class);
	
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping("categoryList.do")
	public String cList(Model model){
		
		logger.info("카테고리 목록 조회");
		
		List<CategoryVO> cList
		=categoryService.selectAll();
		
		logger.info("카테고리 조회 결과, cList.size()={}", cList.size());
		
		model.addAttribute("cList", cList);
		
		return "inc/categoryList";
		
		
	}
	
	
}
