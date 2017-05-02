package com.one.yolo.booking.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookingServiceImpl implements BookingService {
	@Autowired
	private BookingDAO bDAO;
	@Override
	public int insertBooking(BookingVO vo) {
		return bDAO.insertBooking(vo);
	}

}
