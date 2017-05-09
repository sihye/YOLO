package com.one.yolo.crecla.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.one.yolo.common.SearchVO;
@Repository
public class ClassDAOMybatis extends SqlSessionDaoSupport implements ClassDAO{
	String nameSpace="config.mybatis.mapper.oracle.class";
	@Override
	public int claInsert(ClassVO vo) {
		return getSqlSession().insert(nameSpace+".claInsert",vo);
	}
	@Override
	public ClassVO selClass(int cNo) {
		return getSqlSession().selectOne(nameSpace+".selClass",cNo);
	}

	@Override
	public List<Map<String, Object>> badClassView(SearchVO vo) {

		return getSqlSession().selectList(nameSpace+".badClassView",vo);
	}
	@Override
	public int badClassCount(SearchVO vo) {

		return getSqlSession().selectOne(nameSpace+".badClassCount",vo);
	}
	@Override
	public int delClass(int cNo) {

		return getSqlSession().update(nameSpace+".delClass",cNo);
	}
	@Override
	public int resetClass(int no) {
		// TODO Auto-generated method stub
		return getSqlSession().update(nameSpace+".resetClass",no);
	}
	@Override
	public Map<String, Object> selectBadClassByCno(int no) {

		return getSqlSession().selectOne(nameSpace+".selectBadClassByCno",no);
	}
	@Override
	public List<ClassVO> selInterCla(String userid) {
		return getSqlSession().selectList(nameSpace+".selInterCla", userid);
	}
	@Override
	public int hitUpdate(int cNo) {
		return getSqlSession().update(nameSpace+".hitUpdate", cNo);
	}
	@Override
	public int schInsert(ScheduleVO vo) {
		return getSqlSession().insert(nameSpace+".schInsert", vo);
	}
	@Override
	public List<Map<String, Object>> selectClassBykNo(SearchVO vo) {
		return getSqlSession().selectList(nameSpace+".selectClassBycNo",vo);
	}
	@Override
	public int selectClassCount(SearchVO vo) {
		return getSqlSession().selectOne(nameSpace+".selectClassCount",vo);
	}
	@Override
	public ScheduleVO selSch(int cNo) {
		return getSqlSession().selectOne(nameSpace+".selSch", cNo);
	}
	@Override
	public List<ClassVO> selClaById(String userid) {
		return getSqlSession().selectList(nameSpace+".selClaById", userid);
	}
	@Override
	public int updateCla(ClassVO vo) {
		return getSqlSession().update(nameSpace+".updateCla", vo);
	}
	@Override
	public int updateSch(ScheduleVO vo) {
		return getSqlSession().update(nameSpace+".updateSch", vo);
	}

	
	

}
