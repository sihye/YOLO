package com.one.yolo.booking.model;

import java.util.List;
import java.util.Map;

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
	@Override
	public int bookNum(int scNo) {
		return bDAO.bookNum(scNo);
	}
	@Override
	public Map<String, Object> selForHostByPmNo(String pmNo) {
		return bDAO.selForHostByPmNo(pmNo);
	}
	@Override
	public List<Map<String, Object>> selMemBybook(BookingVO vo) {
		return bDAO.selMemBybook(vo);
	}

}
