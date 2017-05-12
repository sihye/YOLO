package com.one.yolo.booking.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
@Repository
public class BookingDAOMybatis extends SqlSessionDaoSupport implements BookingDAO{
	private String nameSpace="config.mybatis.mapper.oracle.booking";
	@Override
	public int insertBooking(BookingVO vo) {
		return getSqlSession().insert(nameSpace+".insertBooking", vo);
	}
	@Override
	public int bookNum(int scNo) {
		return getSqlSession().selectOne(nameSpace+".bookNum", scNo);
	}
	@Override
	public Map<String, Object> selForHostByPmNo(String pmNo) {
		return getSqlSession().selectOne(nameSpace+".selForHostByPmNo", pmNo);
	}
	@Override
	public List<Map<String, Object>> selMemBybook(BookingVO vo) {
		System.out.println("dao book vo="+vo);
		List<Map<String, Object>> alist=getSqlSession().selectList(nameSpace+".selMemBybook", vo);
		System.out.println("alist size="+alist.size());
		return getSqlSession().selectList(nameSpace+".selMemBybook", vo);
	}
	@Override
	public int complete(String pmNo) {
		return getSqlSession().update(nameSpace+".complete", pmNo);
	}

}
