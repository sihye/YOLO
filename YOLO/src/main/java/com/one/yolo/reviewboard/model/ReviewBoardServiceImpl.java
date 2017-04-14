package com.one.yolo.reviewboard.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewBoardServiceImpl implements ReviewBoardService{
	@Autowired
	private ReviewBoardDAO reviewboardDao;
	
	public List<Map<String, Object>> selectReviewBoard(){
		return reviewboardDao.selectReviewBoard();
	}
		
}
