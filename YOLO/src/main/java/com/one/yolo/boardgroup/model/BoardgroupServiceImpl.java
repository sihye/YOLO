package com.one.yolo.boardgroup.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardgroupServiceImpl implements BoardgroupService {
	@Autowired
	private BoardgroupDAO dao;
	
	/*@Override
	public int insertBoardgroup(BoardgroupVO vo) {
		return dao.insertBoardgroup(vo);
	}*/
	
	@Override
	public List<BoardgroupVO> selectBoardgroup(){
		return dao.selectBoardgroup();
	}
	
}
