package com.one.yolo.mypage.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HostClassServiceImpl implements HostClassService {
	@Autowired
	private HostClassDAO hDAO;

	@Override
	public List<Map<String, Object>> selClaForHost(String userid) {
		return hDAO.selClaForHost(userid);
	}
}
