package com.one.yolo.admin.model;

public class OperAtorVO {
	private int opNo;
	private int fNo;
	private int kNo;
	private String opShowflag;
	public int getOpNo() {
		return opNo;
	}
	public void setOpNo(int opNo) {
		this.opNo = opNo;
	}
	public int getfNo() {
		return fNo;
	}
	public void setfNo(int fNo) {
		this.fNo = fNo;
	}
	public int getkNo() {
		return kNo;
	}
	public void setkNo(int kNo) {
		this.kNo = kNo;
	}
	public String getOpShowflag() {
		return opShowflag;
	}
	public void setOpShowflag(String opShowflag) {
		this.opShowflag = opShowflag;
	}
	@Override
	public String toString() {
		return "OperAtorVO [opNo=" + opNo + ", fNo=" + fNo + ", kNo=" + kNo + ", opShowflag=" + opShowflag
				+ ", getOpNo()=" + getOpNo() + ", getfNo()=" + getfNo() + ", getkNo()=" + getkNo()
				+ ", getOpShowflag()=" + getOpShowflag() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
	
	
	
}
