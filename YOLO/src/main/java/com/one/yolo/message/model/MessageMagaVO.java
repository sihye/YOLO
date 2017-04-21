package com.one.yolo.message.model;

public class MessageMagaVO {
	private int msNo;
	private String mUserid;
	private String msCheck;
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
	public String getMsCheck() {
		return msCheck;
	}
	public void setMsCheck(String msCheck) {
		this.msCheck = msCheck;
	}
	@Override
	public String toString() {
		return "MessageMagaVO [msNo=" + msNo + ", mUserid=" + mUserid + ", msCheck=" + msCheck + "]";
	}
	
}
