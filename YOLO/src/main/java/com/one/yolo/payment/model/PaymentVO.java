package com.one.yolo.payment.model;

import java.sql.Timestamp;

public class PaymentVO {
	private int pmNo;
	private int cNo;
	private String mUserid;
	private String pmPaymentwayPAYMENTWAY;
	private Timestamp pmPaymentdate;
	private String pmCompletecheck;
	private String pmCancelcheck;
	public int getPmNo() {
		return pmNo;
	}
	public void setPmNo(int pmNo) {
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
	public String getPmPaymentwayPAYMENTWAY() {
		return pmPaymentwayPAYMENTWAY;
	}
	public void setPmPaymentwayPAYMENTWAY(String pmPaymentwayPAYMENTWAY) {
		this.pmPaymentwayPAYMENTWAY = pmPaymentwayPAYMENTWAY;
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
	@Override
	public String toString() {
		return "PaymentVO [pmNo=" + pmNo + ", cNo=" + cNo + ", mUserid=" + mUserid + ", pmPaymentwayPAYMENTWAY="
				+ pmPaymentwayPAYMENTWAY + ", pmPaymentdate=" + pmPaymentdate + ", pmCompletecheck=" + pmCompletecheck
				+ ", pmCancelcheck=" + pmCancelcheck + "]";
	}
	
}
