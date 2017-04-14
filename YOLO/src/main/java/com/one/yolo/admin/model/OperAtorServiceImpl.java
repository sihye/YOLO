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

	@Override
	public int delupdate(int op_no) {
		
		return dao.delupdate(op_no);
	}

	@Override
	public OperAtorVO selectByNo(int op_no) {
		return dao.selectByNo(op_no);
	}

	@Override
	public Map<String, Object> opjoinSelectByOpno(int no) {
		return dao.opjoinSelectByOpno(no);
	}
	
	
	
	
	
}
