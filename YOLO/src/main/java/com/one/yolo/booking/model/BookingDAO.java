package com.one.yolo.booking.model;

import java.util.Map;

public interface BookingDAO {
	public int insertBooking(BookingVO vo);
	public int bookNum(int scNo);
	public Map<String, Object> selForHostByPmNo(String pmNo);
}
