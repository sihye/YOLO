package com.one.yolo.crecla.model;

import java.util.List;
import java.util.Map;

import com.one.yolo.common.SearchVO;

public interface ClassDAO {
	public int claInsert(ClassVO vo);
	public ClassVO selClass(int cNo);
	public List<Map<String, Object>>badClassView(SearchVO vo);
	public int badClassCount(SearchVO vo);
	public int delClass(int no);
	public int resetClass(int no);
	public Map<String, Object> selectBadClassByCno(int no);
	public List<ClassVO> selInterCla(String userid);
	public int hitUpdate(int cNo);
	public int schInsert(ScheduleVO vo);
}
