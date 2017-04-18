package com.one.yolo.category.model;

public class CategoryGroupVO {
	/*KG_NO   NUMBER        NOT NULL, -- 분류번호
	KG_CODE NUMBER        NOT NULL, -- 분류코드
	KG_NAME VARCHAR2(500)*/
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
