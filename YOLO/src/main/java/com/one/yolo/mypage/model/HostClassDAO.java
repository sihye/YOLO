package com.one.yolo.mypage.model;

import java.util.List;
import java.util.Map;

public interface HostClassDAO {
	public List<Map<String, Object>> selClaForHost (String userid);
}
