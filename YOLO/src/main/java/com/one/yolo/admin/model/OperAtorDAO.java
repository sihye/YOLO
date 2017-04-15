package com.one.yolo.admin.model;

import java.util.List;
import java.util.Map;

public interface OperAtorDAO {
	public int insertOperAtor(OperAtorVO vo);
	public List<Map<String,Object>> selectJoin();
	public Map<String,Object> opjoinSelectByOpno(int no);
	public int delupdate(int op_no);
	public OperAtorVO selectByNo(int op_no);
	
}
