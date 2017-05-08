package com.one.yolo.classboard.model;

import java.util.List;

import com.one.yolo.common.SearchVO;

public interface ClassBoardDAO {
	public List<ClassBoardVO> selectClassBoard(ClassBoardVO vo);
	public int selectClassBoardCount(ClassBoardVO vo);
	public int insertClassBoard(ClassBoardVO vo);
}
