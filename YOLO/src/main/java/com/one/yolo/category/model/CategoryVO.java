package com.one.yolo.category.model;

public class CategoryVO {
	private int kNo;
	private int kgNo;
	private String kCode;
	private String kName;
	
	
	public int getkNo() {
		return kNo;
	}
	public void setkNo(int kNo) {
		this.kNo = kNo;
	}
	public int getKgNo() {
		return kgNo;
	}
	public void setKgNo(int kgNo) {
		this.kgNo = kgNo;
	}
	public String getkCode() {
		return kCode;
	}
	public void setkCode(String kCode) {
		this.kCode = kCode;
	}
	public String getkName() {
		return kName;
	}
	public void setkName(String kName) {
		this.kName = kName;
	}
	@Override
	public String toString() {
		return "CategoryVO [kNo=" + kNo + ", kgNo=" + kgNo + ", kCode=" + kCode + ", kName=" + kName + "]";
	}
	
	
	
	
}
