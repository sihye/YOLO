package com.one.yolo.reviewboard.model;

import java.util.List;
import java.util.Map;

import com.one.yolo.common.SearchVO;

public interface ReviewBoardService {
	public List<Map<String, Object>> selectReviewBoard(SearchVO searchVO);
}
