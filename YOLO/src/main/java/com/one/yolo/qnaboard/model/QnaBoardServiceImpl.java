package com.one.yolo.qnaboard.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaBoardServiceImpl implements QnaBoardService{
	
	@Autowired
	private QnaBoardDAO qnaboardDao;
	@Override
	public List<Map<String, Object>> selectQnaBoard() {
		return qnaboardDao.selectQnaBoard();
	}
	
}
