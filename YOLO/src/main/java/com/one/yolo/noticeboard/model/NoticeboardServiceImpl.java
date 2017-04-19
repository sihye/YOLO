package com.one.yolo.noticeboard.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.yolo.common.SearchVO;

@Service
public class NoticeboardServiceImpl 
	implements NoticeboardService {
	
	@Autowired
	private NoticeboardDAO dao;

	@Override
	public List<NoticeboardVO> selectNoticeboard(SearchVO searchVo) {
		return dao.selectNoticeboard(searchVo);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return dao.selectTotalRecord(searchVo);
	}
	
	@Override
	public int insertNoticboard(NoticeboardVO vo) {
		return dao.insertNoticboard(vo);
	}

	@Override
	public NoticeboardVO selectNo(int no) {
		return dao.selectNo(no);
	}

	@Override
	public int updateReadCount(int no) {
		return dao.updateReadCount(no);
	}
	
	@Override
	public int updateNotice(NoticeboardVO vo){
		return dao.updateNotice(vo);
	}


}
