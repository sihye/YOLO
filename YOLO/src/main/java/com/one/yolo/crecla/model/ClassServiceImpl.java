package com.one.yolo.crecla.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClassServiceImpl implements ClassService {
	@Autowired
	private ClassDAO dao;
	@Override
	public int claInsert(ClassVO vo) {
		return dao.claInsert(vo);
	}
	@Override
	public ClassVO selClass(int cNo) {
		return dao.selClass(cNo);
	}

}
