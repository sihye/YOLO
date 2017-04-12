package com.one.yolo.qnaboard.model;

import java.util.List;
import java.util.Map;

public interface QnaBoardDAO {
	public List<Map<String, Object>> selectQnaBoard();
}
