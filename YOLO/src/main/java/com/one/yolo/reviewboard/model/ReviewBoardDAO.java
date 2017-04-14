package com.one.yolo.reviewboard.model;

import java.util.List;
import java.util.Map;

import com.one.yolo.common.SearchVO;

public interface ReviewBoardDAO {
	public List<Map<String, Object>> selectReviewBoard(SearchVO searchVO);
}
