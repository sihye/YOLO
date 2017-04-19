package com.one.yolo.boardgroup.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.yolo.boardgroup.model.BoardgroupService;
import com.one.yolo.boardgroup.model.BoardgroupVO;


@Controller
@RequestMapping(value="/boardgroup")
public class BoardgroupController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardgroupController.class);

	
	@Autowired
	private BoardgroupService boardgroupService;
	
	@RequestMapping(value="/list.do")
	public String upfile_get(Model model){
		logger.info("boardgroplist화면");
		List<BoardgroupVO> list = boardgroupService.selectBoardgroup();	
		model.addAttribute("list",list);
		
		return "boardgroup/list";
	}

	/*@RequestMapping(value="/list.do",method=RequestMethod.POST)
	public String upfile_post(HttpServletRequest request ,@ModelAttribute BoardgroupVO vo){
		//1
		logger.info("리스트확인, 파라미터 boardgroupVo={}", vo);*/
	
	
	
}
