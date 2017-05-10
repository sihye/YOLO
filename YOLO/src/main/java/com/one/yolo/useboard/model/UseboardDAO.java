package com.one.yolo.useboard.model;

import java.util.List;

public interface UseboardDAO {
	public List<UseboardVO> selectUseboard(UseboardVO vo);
	public int selectTotalRecord(UseboardVO vo);
	
	public int insertUseboard(UseboardVO vo);
	public UseboardVO selectNo(int no);
	public int updateReadCount(int no);
	/*public int updateUse(UseboardVO vo);
	public int deleteUseboard(int no);*/

}
