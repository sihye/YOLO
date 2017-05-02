package com.one.yolo.booking.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
@Repository
public class BookingDAOMybatis extends SqlSessionDaoSupport implements BookingDAO{
	private String nameSpace="config.mybatis.mapper.oracle.booking";
	@Override
	public int insertBooking(BookingVO vo) {
		return getSqlSession().insert(nameSpace+".insertBooking", vo);
	}

}
