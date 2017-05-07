package com.one.yolo.qnaboard.model;

import java.sql.Timestamp;

public class QnaRepayVO {
	private int cqrNo;
	private int cqNo;
	private String mUserid;
	private String cqrContent;
	private String cqrDelflag;
	private Timestamp cqrRegdate;
	public int getCqrNo() {
		return cqrNo;
	}
	public void setCqrNo(int cqrNo) {
		this.cqrNo = cqrNo;
	}
	public int getCqNo() {
		return cqNo;
	}
	public void setCqNo(int cqNo) {
		this.cqNo = cqNo;
	}
	public String getmUserid() {
		return mUserid;
	}
	public void setmUserid(String mUserid) {
		this.mUserid = mUserid;
	}
	public String getCqrContent() {
		return cqrContent;
	}
	public void setCqrContent(String cqrContent) {
		this.cqrContent = cqrContent;
	}
	public String getCqrDelflag() {
		return cqrDelflag;
	}
	public void setCqrDelflag(String cqrDelflag) {
		this.cqrDelflag = cqrDelflag;
	}
	public Timestamp getCqrRegdate() {
		return cqrRegdate;
	}
	public void setCqrRegdate(Timestamp cqrRegdate) {
		this.cqrRegdate = cqrRegdate;
	}
	@Override
	public String toString() {
		return "QnaRepayVO [cqrNo=" + cqrNo + ", cqNo=" + cqNo + ", mUserid=" + mUserid + ", cqrContent=" + cqrContent
				+ ", cqrDelflag=" + cqrDelflag + ", cqrRegdate=" + cqrRegdate + "]";
	}
	
	
}
