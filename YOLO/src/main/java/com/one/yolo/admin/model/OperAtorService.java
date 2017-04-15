package com.one.yolo.admin.model;

import java.util.List;
import java.util.Map;

public interface OperAtorService {
	public int insertOperAtor(OperAtorVO vo);
	public List<Map<String,Object>> selectJoin();
	public int delupdate(int op_no);
	public OperAtorVO selectByNo(int op_no);
	public Map<String,Object> opjoinSelectByOpno(int no);
}
