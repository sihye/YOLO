package com.one.yolo.reviewboard.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.yolo.common.SearchVO;

@Service
public class ReviewBoardServiceImpl implements ReviewBoardService{
	@Autowired
	private ReviewBoardDAO reviewboardDao;
	
	public List<Map<String, Object>> selectReviewBoard(SearchVO searchVO){
		return reviewboardDao.selectReviewBoard(searchVO);
	}
		
}
