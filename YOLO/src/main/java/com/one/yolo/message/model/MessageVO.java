package com.one.yolo.message.model;

import java.sql.Timestamp;

public class MessageVO {
	private int msNo;
	private String mUserid;
	private String msTitle;
	private String msContent;
	private Timestamp msRegdate;
	public int getMsNo() {
		return msNo;
	}
	public void setMsNo(int msNo) {
		this.msNo = msNo;
	}
	public String getmUserid() {
		return mUserid;
	}
	public void setmUserid(String mUserid) {
		this.mUserid = mUserid;
	}
	public String getMsTitle() {
		return msTitle;
	}
	public void setMsTitle(String msTitle) {
		this.msTitle = msTitle;
	}
	public String getMsContent() {
		return msContent;
	}
	public void setMsContent(String msContent) {
		this.msContent = msContent;
	}
	public Timestamp getMsRegdate() {
		return msRegdate;
	}
	public void setMsRegdate(Timestamp msRegdate) {
		this.msRegdate = msRegdate;
	}
	@Override
	public String toString() {
		return "MessageVO [msNo=" + msNo + ", mUserid=" + mUserid + ", msTitle=" + msTitle + ", msContent=" + msContent
				+ ", msRegdate=" + msRegdate + "]";
	}
	
	
}
