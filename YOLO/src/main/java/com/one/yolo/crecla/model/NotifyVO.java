package com.one.yolo.crecla.model;

import java.sql.Timestamp;

public class NotifyVO {
/*CREATE TABLE notify (
    n_no    number not null,
	C_NO      NUMBER        NOT NULL, -- 클래스번호
	N_CODE    VARCHAR2(500) NOT NULL, -- 신고항목
	N_REGDEAT DATE		DEFAULT SYSDATE,
	n_userid    VARCHAR2(500) NOT NULL,
	N_CONTENT VARCHAR2(500) NOT NULL  -- 신고내용
);*/
	private int nNo;
	private int cNo;
	private String nCode;
	private Timestamp nRegdate;
	private String nContent;
	private String nUserid;
	
	public int getcNo() {
		return cNo;
	}
	public void setcNo(int cNo) {
		this.cNo = cNo;
	}
	public String getnCode() {
		return nCode;
	}
	public void setnCode(String nCode) {
		this.nCode = nCode;
	}
	public Timestamp getnRegdate() {
		return nRegdate;
	}
	public void setnRegdate(Timestamp nRegdate) {
		this.nRegdate = nRegdate;
	}
	public String getnContent() {
		return nContent;
	}
	public void setnContent(String nContent) {
		this.nContent = nContent;
	}
	public int getnNo() {
		return nNo;
	}
	public void setnNo(int nNo) {
		this.nNo = nNo;
	}
	public String getnUserid() {
		return nUserid;
	}
	public void setnUserid(String nUserid) {
		this.nUserid = nUserid;
	}
	@Override
	public String toString() {
		return "NotifyVO [nNo=" + nNo + ", cNo=" + cNo + ", nCode=" + nCode + ", nRegdate=" + nRegdate + ", nContent="
				+ nContent + ", nUserid=" + nUserid + "]";
	}
	
	
	
	

}
