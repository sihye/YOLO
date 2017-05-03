package com.one.yolo.payment.model;

import java.sql.Timestamp;

public class PaymentVO {
	/*
	 * CREATE TABLE payment (
	PM_NO            NUMBER        NOT NULL, -- 결제번호
	C_NO             NUMBER        NOT NULL, -- 클래스번호
	M_USERID         VARCHAR2(500) NOT NULL, -- 아이디
	BK_NO            NUMBER        NOT NULL,     -- 예약번호
	PM_PAYMENTWAY    VARCHAR2(500) NULL,     -- 결제방법
	PM_PAYMENTDATE   DATE          NULL,     -- 결제일
	PM_COMPLETECHECK VARCHAR2(500)      DEFAULT 'N' , -- 결제완료여부
	PM_CANCELCHECK   VARCHAR2(500)      DEFAULT'N' -- 결제취소여부
);
	*/
	private String pmNo;
	private int cNo;
	private String mUserid;
	private String pmPaymentway;
	private Timestamp pmPaymentdate;
	private String pmCompletecheck;
	private String pmCancelcheck;
	private int bkNo;
	
	public String getPmNo() {
		return pmNo;
	}
	public void setPmNo(String pmNo) {
		this.pmNo = pmNo;
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
	public String getPmPaymentway() {
		return pmPaymentway;
	}
	public void setPmPaymentway(String pmPaymentway) {
		this.pmPaymentway = pmPaymentway;
	}
	public Timestamp getPmPaymentdate() {
		return pmPaymentdate;
	}
	public void setPmPaymentdate(Timestamp pmPaymentdate) {
		this.pmPaymentdate = pmPaymentdate;
	}
	public String getPmCompletecheck() {
		return pmCompletecheck;
	}
	public void setPmCompletecheck(String pmCompletecheck) {
		this.pmCompletecheck = pmCompletecheck;
	}
	public String getPmCancelcheck() {
		return pmCancelcheck;
	}
	public void setPmCancelcheck(String pmCancelcheck) {
		this.pmCancelcheck = pmCancelcheck;
	}
	public int getBkNo() {
		return bkNo;
	}
	public void setBkNo(int bkNo) {
		this.bkNo = bkNo;
	}
	@Override
	public String toString() {
		return "PaymentVO [pmNo=" + pmNo + ", cNo=" + cNo + ", mUserid=" + mUserid + ", pmPaymentway=" + pmPaymentway
				+ ", pmPaymentdate=" + pmPaymentdate + ", pmCompletecheck=" + pmCompletecheck + ", pmCancelcheck="
				+ pmCancelcheck + ", bkNo=" + bkNo + "]";
	}
	
	
	
}
