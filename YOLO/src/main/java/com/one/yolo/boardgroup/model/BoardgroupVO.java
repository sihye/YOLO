package com.one.yolo.boardgroup.model;

import java.util.Date;

public class BoardgroupVO {
	private int bgNo;
	private String bgName;
	private String bgInfo;
	private int bgOrder;
	private String bgReplycheck;
	private String bgFileupcheck;
	private int bgFileupnumber;
	private int bgFilesize;
	private Date bgEditdate;
	public int getBgNo() {
		return bgNo;
	}
	public void setBgNo(int bgNo) {
		this.bgNo = bgNo;
	}
	public String getBgName() {
		return bgName;
	}
	public void setBgName(String bgName) {
		this.bgName = bgName;
	}
	public String getBgInfo() {
		return bgInfo;
	}
	public void setBgInfo(String bgInfo) {
		this.bgInfo = bgInfo;
	}
	public int getBgOrder() {
		return bgOrder;
	}
	public void setBgOrder(int bgOrder) {
		this.bgOrder = bgOrder;
	}
	public String getBgReplycheck() {
		return bgReplycheck;
	}
	public void setBgReplycheck(String bgReplycheck) {
		this.bgReplycheck = bgReplycheck;
	}
	public String getBgFileupcheck() {
		return bgFileupcheck;
	}
	public void setBgFileupcheck(String bgFileupcheck) {
		this.bgFileupcheck = bgFileupcheck;
	}
	public int getBgFileupnumber() {
		return bgFileupnumber;
	}
	public void setBgFileupnumber(int bgFileupnumber) {
		this.bgFileupnumber = bgFileupnumber;
	}
	public int getBgFilesize() {
		return bgFilesize;
	}
	public void setBgFilesize(int bgFilesize) {
		this.bgFilesize = bgFilesize;
	}
	public Date getBgEditdate() {
		return bgEditdate;
	}
	public void setBgEditdate(Date bgEditdate) {
		this.bgEditdate = bgEditdate;
	}
	@Override
	public String toString() {
		return "boardgroupVO [bgNo=" + bgNo + ", bgName=" + bgName + ", bgInfo=" + bgInfo + ", bgOrder=" + bgOrder
				+ ", bgReplycheck=" + bgReplycheck + ", bgFileupcheck=" + bgFileupcheck + ", bgFileupnumber="
				+ bgFileupnumber + ", bgFilesize=" + bgFilesize + ", bgEditdate=" + bgEditdate + "]";
	}
	
	
	
}
