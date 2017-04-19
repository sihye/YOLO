package com.one.yolo.favoriteclass.model;

import java.sql.Timestamp;

public class FavoriteClassVO {
	private int sbNo;
	private String sbUserid;
	private int cNo;
	private Timestamp scRegdate;
	public int getSbNo() {
		return sbNo;
	}
	public void setSbNo(int sbNo) {
		this.sbNo = sbNo;
	}
	public String getSbUserid() {
		return sbUserid;
	}
	public void setSbUserid(String sbUserid) {
		this.sbUserid = sbUserid;
	}
	public int getcNo() {
		return cNo;
	}
	public void setcNo(int cNo) {
		this.cNo = cNo;
	}
	public Timestamp getScRegdate() {
		return scRegdate;
	}
	public void setScRegdate(Timestamp scRegdate) {
		this.scRegdate = scRegdate;
	}
	@Override
	public String toString() {
		return "FavoriteClassVO [sbNo=" + sbNo + ", sbUserid=" + sbUserid + ", cNo=" + cNo + ", scRegdate=" + scRegdate
				+ "]";
	}
	
	
}
