package com.one.yolo.qnaboard.model;

import java.util.List;
import java.util.Map;

import com.one.yolo.common.SearchVO;

public interface QnaBoardDAO {
	public List<Map<String, Object>> selectQnaBoard(SearchVO searchVO);
	public int selectTotalRecord(SearchVO searchVo);
}