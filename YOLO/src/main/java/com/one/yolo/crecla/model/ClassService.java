package com.one.yolo.crecla.model;

import java.util.List;
import java.util.Map;

import com.one.yolo.common.SearchClassVO;
import com.one.yolo.common.SearchVO;

public interface ClassService {
	public int claInsert(ClassVO vo, ScheduleVO sVo);
	public ClassVO selClass(int cNo);
	public List<Map<String, Object>>badClassView(SearchVO vo);
	public int badClassCount(SearchVO vo);
	public int editBadClass(int no, String type);
	public Map<String, Object> selectBadClassByCno(int no);
	public List<ClassVO> selInterCla(String userid);
	public int hitUpdate(int cNo);
	public List<Map<String, Object>> selectClassBykNo(SearchVO vo);
	public int selectClassCount(SearchVO vo);
	public ScheduleVO selSch(int cNo);
	public List<ClassVO> selClaById(String userid);
	public int updateCla(ClassVO vo);
	public int updateSch(ScheduleVO vo);
	public int deleteCla(int cNo);
	public int notyInsert(NotifyVO vo);
	public List<Map<String, Object>> searchselectClass(SearchClassVO vo);
	public int searchselectClassCount(SearchClassVO vo);
}
