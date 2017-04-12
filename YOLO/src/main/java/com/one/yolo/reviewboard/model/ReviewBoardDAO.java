package com.one.yolo.reviewboard.model;

import java.util.List;
import java.util.Map;

public interface ReviewBoardDAO {
	public List<Map<String, Object>> selectReviewBoard();
}
