package com.one.yolo.useboard.model;

import java.util.List;
import java.util.Map;

import com.one.yolo.common.SearchVO;

public interface UseboardDAO {
	public List<UseboardVO> selectUseboard(SearchVO searchVo);
	public int selectTotalRecord(SearchVO searchVo);
	
	public int insertUseboard(UseboardVO vo);
	public UseboardVO selectNo(int no);
	public int updateReadCount(int no);
	public int updateUse(UseboardVO vo);
	public int deleteUseboard(int no);

}
