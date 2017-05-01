package com.one.yolo.classboard.model;

import java.sql.Timestamp;

import com.one.yolo.common.SearchVO;

public class ClassBoardVO extends SearchVO{
	private int cbNo;
	private int cNo;
	private String mUserid;
	private String cbTitle;
	private Timestamp cbRegdate;
	private int cbReadcount;
	private String cbContent;
	private int fNo1;
	private int fNo2;
	private int fNo3;
	
	
	
	public int getCbNo() {
		return cbNo;
	}
	public void setCbNo(int cbNo) {
		this.cbNo = cbNo;
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
	public String getCbTitle() {
		return cbTitle;
	}
	public void setCbTitle(String cbTitle) {
		this.cbTitle = cbTitle;
	}
	public Timestamp getCbRegdate() {
		return cbRegdate;
	}
	public void setCbRegdate(Timestamp cbRegdate) {
		this.cbRegdate = cbRegdate;
	}
	public int getCbReadcount() {
		return cbReadcount;
	}
	public void setCbReadcount(int cbReadcount) {
		this.cbReadcount = cbReadcount;
	}
	public String getCbContent() {
		return cbContent;
	}
	public void setCbContent(String cbContent) {
		this.cbContent = cbContent;
	}
	public int getfNo1() {
		return fNo1;
	}
	public void setfNo1(int fNo1) {
		this.fNo1 = fNo1;
	}
	public int getfNo2() {
		return fNo2;
	}
	public void setfNo2(int fNo2) {
		this.fNo2 = fNo2;
	}
	public int getfNo3() {
		return fNo3;
	}
	public void setfNo3(int fNo3) {
		this.fNo3 = fNo3;
	}
	
	
	
	
}
