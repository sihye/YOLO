package com.one.yolo.mypage.model;

import java.util.List;
import java.util.Map;

public interface HostClassDAO {
	public List<Map<String, Object>> selClaForHost (String userid);
	public List<Map<String, Object>>selForStatsGender(int cNo);
	public List<Map<String, Object>>selForStatsAge(int cNo);
	public List<Map<String, Object>>selForStatsSales(String userid);
}
