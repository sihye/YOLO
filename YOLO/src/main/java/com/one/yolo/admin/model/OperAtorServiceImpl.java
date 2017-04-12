package com.one.yolo.admin.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OperAtorServiceImpl implements OperAtorService {
	@Autowired
	private OperAtorDAO dao;
	
	@Override
	public int insertOperAtor(OperAtorVO vo) {
		return dao.insertOperAtor(vo);
	}

	@Override
	public List<Map<String, Object>> selectJoin() {
		return dao.selectJoin();
	}
	
	
}
