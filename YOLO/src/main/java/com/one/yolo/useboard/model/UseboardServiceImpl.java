package com.one.yolo.useboard.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UseboardServiceImpl 
	implements UseboardService {
	
	@Autowired
	private UseboardDAO dao;
	
	@Override
	public List<UseboardVO> selectUseboard(UseboardVO vo) {
		return dao.selectUseboard(vo);
	}

	@Override
	public int selectTotalRecord(UseboardVO vo) {
		return dao.selectTotalRecord(vo);
	}

	@Override
	public int insertUseboard(UseboardVO vo) {
		return dao.insertUseboard(vo);
	}

	@Override
	public UseboardVO selectNo(int no) {
		return dao.selectNo(no);
	}

	@Override
	public int updateReadCount(int no) {
		return dao.updateReadCount(no);
	}
	
	@Override
	public int updateUse(UseboardVO vo){
		return dao.updateUse(vo);
	}

	@Override
	public int deleteUseboard(int no) {
		return dao.deleteUseboard(no);
	}

	

}
