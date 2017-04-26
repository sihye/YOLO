package com.one.yolo.follow.model;

import java.sql.Timestamp;

public class FollowVO {
	private int flNo;
	private String flUserid;
	private String flWuserid;
	private Timestamp flRegdate;
	public int getFlNo() {
		return flNo;
	}
	public void setFlNo(int flNo) {
		this.flNo = flNo;
	}
	public String getFlUserid() {
		return flUserid;
	}
	public void setFlUserid(String flUserid) {
		this.flUserid = flUserid;
	}
	public String getFlWuserid() {
		return flWuserid;
	}
	public void setFlWuserid(String flWuserid) {
		this.flWuserid = flWuserid;
	}
	public Timestamp getFlRegdate() {
		return flRegdate;
	}
	public void setFlRegdate(Timestamp flRegdate) {
		this.flRegdate = flRegdate;
	}
	@Override
	public String toString() {
		return "FollowVO [flNo=" + flNo + ", flUserid=" + flUserid + ", flWuserid=" + flWuserid + ", flRegdate="
				+ flRegdate + "]";
	}
	
}
