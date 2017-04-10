package com.one.yolo.admin.model;

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
	
	
}
