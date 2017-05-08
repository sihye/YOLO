package com.one.yolo.booking.model;

import java.util.Map;

public interface BookingService {
	public int insertBooking(BookingVO vo);
	public int bookNum(int scNo);
	public Map<String, Object> selForHostByPmNo(String pmNo);
}
