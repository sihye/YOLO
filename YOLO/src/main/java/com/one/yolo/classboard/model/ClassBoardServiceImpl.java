package com.one.yolo.classboard.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.yolo.common.SearchVO;

@Service
public class ClassBoardServiceImpl implements ClassBoardService{
	@Autowired
	ClassBoardDAO dao;
	
	
	@Override
	public List<ClassBoardVO> selectClassBoard(ClassBoardVO vo) {
		return dao.selectClassBoard(vo);
	}


	@Override
	public int selectClassBoardCount(ClassBoardVO vo) {
		return dao.selectClassBoardCount(vo);
	}


	@Override
	public int insertClassBoard(ClassBoardVO vo) {
		return dao.insertClassBoard(vo);
	}


	@Override
	public ClassBoardVO selectClassBoardBycbNo(int cbNo) {
		return dao.selectClassBoardBycbNo(cbNo);
	}


	@Override
	public int readCountUp(int cbNo) {
		return dao.readCountUp(cbNo);
	}


	@Override
	public int deleteClassBoard(int cbNo) {
		return dao.deleteClassBoard(cbNo);
	}


	@Override
	public int updateClassBoard(ClassBoardVO vo) {
		return dao.updateClassBoard(vo);
	}
	
	
	
	
	
	
	

}
