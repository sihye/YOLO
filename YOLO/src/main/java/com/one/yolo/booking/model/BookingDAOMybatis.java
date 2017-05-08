package com.one.yolo.booking.model;

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

}
