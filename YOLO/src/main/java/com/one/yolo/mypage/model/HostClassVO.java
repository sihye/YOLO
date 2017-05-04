package com.one.yolo.mypage.model;

import java.util.List;
import java.util.Map;

import com.one.yolo.crecla.model.ClassVO;

public class HostClassVO {
	private ClassVO claVo;
	private List<Map<String, Object>>bookingList;
	public ClassVO getClaVo() {
		return claVo;
	}
	public void setClaVo(ClassVO claVo) {
		this.claVo = claVo;
	}
	public List<Map<String, Object>> getBookingList() {
		return bookingList;
	}
	public void setBookingList(List<Map<String, Object>> bookingList) {
		this.bookingList = bookingList;
	}
	@Override
	public String toString() {
		return "HostClassVO [claVo=" + claVo + ", bookingList=" + bookingList + "]";
	}
	
	
}
