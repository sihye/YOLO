package com.one.yolo.qnaboard.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.yolo.common.SearchVO;

@Service
public class QnaBoardServiceImpl implements QnaBoardService{
	
	@Autowired
	private QnaBoardDAO qnaboardDao;
	
	@Override
	public List<Map<String, Object>> selectQnaBoard(SearchVO searchVO) {
		return qnaboardDao.selectQnaBoard(searchVO);
	}
	
}
