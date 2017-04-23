package com.one.yolo.message.model;

public class MessageMagaVO {
	private int msNo;
	private String msmgUserid;
	private String msCheck;
	public int getMsNo() {
		return msNo;
	}
	public void setMsNo(int msNo) {
		this.msNo = msNo;
	}
	
	public String getMsmgUserid() {
		return msmgUserid;
	}
	public void setMsmgUserid(String msmgUserid) {
		this.msmgUserid = msmgUserid;
	}
	public String getMsCheck() {
		return msCheck;
	}
	public void setMsCheck(String msCheck) {
		this.msCheck = msCheck;
	}
	@Override
	public String toString() {
		return "MessageMagaVO [msNo=" + msNo + ", msmgUserid=" + msmgUserid + ", msCheck=" + msCheck + "]";
	}
	
}
