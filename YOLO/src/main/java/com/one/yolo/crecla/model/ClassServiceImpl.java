package com.one.yolo.crecla.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.one.yolo.common.SearchVO;

@Service
public class ClassServiceImpl implements ClassService {
	private static final Logger logger=LoggerFactory.getLogger(ClassServiceImpl.class);
	@Autowired
	private ClassDAO dao;
	
	@Override
	@Transactional
	public int claInsert(ClassVO vo, ScheduleVO sVo) {
		int cnt=dao.claInsert(vo);
		logger.info("클래스디비 인서트 cnt={}",cnt);
		sVo.setcNo(vo.getcNo());
		logger.info("스케줄 vo={}",sVo);
		cnt=dao.schInsert(sVo);
		logger.info("스케줄디비 인서트 cnt={}",cnt);
		return cnt;
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
	
	@Override
	public List<ClassVO> selInterCla(String userid) {
		return dao.selInterCla(userid);
	}
	@Override
	public int hitUpdate(int cNo) {
		return dao.hitUpdate(cNo);
	}
	@Override
	public List<Map<String, Object>> selectClassBykNo(SearchVO vo) {
		
		return dao.selectClassBykNo(vo);
	}
	@Override
	public int selectClassCount(SearchVO vo) {
		return dao.selectClassCount(vo);
	}
	@Override
	public ScheduleVO selSch(int cNo) {
		return dao.selSch(cNo);
	}
	@Override
	public List<ClassVO> selClaById(String userid) {
		return dao.selClaById(userid);
	}
	@Override
	public int updateCla(ClassVO vo) {
		return dao.updateCla(vo);
	}
	@Override
	public int updateSch(ScheduleVO vo) {
		return dao.updateSch(vo);
	}
	@Override
	public int deleteCla(int cNo) {
		return dao.delClass(cNo);
	}
	@Override
	public int notyInsert(NotifyVO vo) {
		return dao.notyInsert(vo);
	}

	
	

	
	
	
}
