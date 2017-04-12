package com.one.yolo.admin.model;

import java.util.List;
import java.util.Map;

public interface OperAtorDAO {
	public int insertOperAtor(OperAtorVO vo);
	public List<Map<String,Object>> selectJoin();
}
