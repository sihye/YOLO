package com.one.yolo.crecla.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.yolo.common.SearchVO;

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
	@Override
	public List<Map<String, Object>> badClassView(SearchVO vo) {

		return dao.badClassView(vo);
	}
	@Override
	public int badClassCount(SearchVO vo) {
		return dao.badClassCount(vo);
	}
	@Override
	public int editBadClass(int no,String type) {

		if(type.equals("del")){
			return dao.delClass(no);
		}else{
			return dao.resetClass(no);
		}
	}
	@Override
	public Map<String, Object> selectBadClassByCno(int no) {
		return dao.selectBadClassByCno(no);
	}

}
