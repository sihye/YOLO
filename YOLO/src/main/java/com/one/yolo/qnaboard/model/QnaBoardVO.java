package com.one.yolo.qnaboard.model;

import java.sql.Timestamp;

public class QnaBoardVO {
	private int cqNo;
	private int cNo;
	private String mUserid;
	private String cqContent;
	private String cqRepaycheck;
	private String cqSecretcheck;
	private String cqDelflag;
	private Timestamp cRegdate;
	public int getCqNo() {
		return cqNo;
	}
	public void setCqNo(int cqNo) {
		this.cqNo = cqNo;
	}
	public int getcNo() {
		return cNo;
	}
	public void setcNo(int cNo) {
		this.cNo = cNo;
	}
	public String getmUserid() {
		return mUserid;
	}
	public void setmUserid(String mUserid) {
		this.mUserid = mUserid;
	}
	public String getCqContent() {
		return cqContent;
	}
	public void setCqContent(String cqContent) {
		this.cqContent = cqContent;
	}
	public String getCqRepaycheck() {
		return cqRepaycheck;
	}
	public void setCqRepaycheck(String cqRepaycheck) {
		this.cqRepaycheck = cqRepaycheck;
	}
	public String getCqSecretcheck() {
		return cqSecretcheck;
	}
	public void setCqSecretcheck(String cqSecretcheck) {
		this.cqSecretcheck = cqSecretcheck;
	}
	public String getCqDelflag() {
		return cqDelflag;
	}
	public void setCqDelflag(String cqDelflag) {
		this.cqDelflag = cqDelflag;
	}
	public Timestamp getcRegdate() {
		return cRegdate;
	}
	public void setcRegdate(Timestamp cRegdate) {
		this.cRegdate = cRegdate;
	}
	@Override
	public String toString() {
		return "QnaBoardVO [cqNo=" + cqNo + ", cNo=" + cNo + ", mUserid=" + mUserid + ", cqContent=" + cqContent
				+ ", cqRepaycheck=" + cqRepaycheck + ", cqSecretcheck=" + cqSecretcheck + ", cqDelflag=" + cqDelflag
				+ ", cRegdate=" + cRegdate + "]";
	}
	
	
}
