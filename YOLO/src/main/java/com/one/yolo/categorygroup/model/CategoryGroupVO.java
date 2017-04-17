package com.one.yolo.categorygroup.model;

public class CategoryGroupVO {
	
	private int kgNo;
	private int kgCode;
	private String kgName;
	
	public int getKgNo() {
		return kgNo;
	}
	public void setKgNo(int kgNo) {
		this.kgNo = kgNo;
	}
	public int getKgCode() {
		return kgCode;
	}
	public void setKgCode(int kgCode) {
		this.kgCode = kgCode;
	}
	public String getKgName() {
		return kgName;
	}
	public void setKgName(String kgName) {
		this.kgName = kgName;
	}
	
	@Override
	public String toString() {
		return "CategoryGroupVO [kgNo=" + kgNo + ", kgCode=" + kgCode + ", kgName=" + kgName + "]";
	}
}
