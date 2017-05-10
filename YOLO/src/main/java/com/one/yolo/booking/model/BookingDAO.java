package com.one.yolo.booking.model;

import java.util.List;
import java.util.Map;

public interface BookingDAO {
	public int insertBooking(BookingVO vo);
	public int bookNum(int scNo);
	public Map<String, Object> selForHostByPmNo(String pmNo);
	public List<Map<String, Object>>selMemBybook(BookingVO vo);
}
