package com.one.yolo.booking.model;

public interface BookingDAO {
	public int insertBooking(BookingVO vo);
	public int bookNum(int scNo);
}
