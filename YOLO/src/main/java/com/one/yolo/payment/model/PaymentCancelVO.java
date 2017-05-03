package com.one.yolo.payment.model;

import java.sql.Timestamp;

public class PaymentCancelVO {
	private int pmcNo;
	private String pmNo;
	private Timestamp pmcDate;
	private String pmcProqress;
	private String pmcCalcel;
	private String pmcDetatl;
	public int getPmcNo() {
		return pmcNo;
	}
	public void setPmcNo(int pmcNo) {
		this.pmcNo = pmcNo;
	}
	
	public String getPmNo() {
		return pmNo;
	}
	public void setPmNo(String pmNo) {
		this.pmNo = pmNo;
	}
	public Timestamp getPmcDate() {
		return pmcDate;
	}
	public void setPmcDate(Timestamp pmcDate) {
		this.pmcDate = pmcDate;
	}
	public String getPmcProqress() {
		return pmcProqress;
	}
	public void setPmcProqress(String pmcProqress) {
		this.pmcProqress = pmcProqress;
	}
	public String getPmcCalcel() {
		return pmcCalcel;
	}
	public void setPmcCalcel(String pmcCalcel) {
		this.pmcCalcel = pmcCalcel;
	}
	public String getPmcDetatl() {
		return pmcDetatl;
	}
	public void setPmcDetatl(String pmcDetatl) {
		this.pmcDetatl = pmcDetatl;
	}
	@Override
	public String toString() {
		return "PaymentCancelVO [pmcNo=" + pmcNo + ", pmNo=" + pmNo + ", pmcDate=" + pmcDate + ", pmcProqress="
				+ pmcProqress + ", pmcCalcel=" + pmcCalcel + ", pmcDetatl=" + pmcDetatl + "]";
	}
	
	
}
