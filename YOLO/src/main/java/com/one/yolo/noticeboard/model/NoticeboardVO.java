package com.one.yolo.noticeboard.model;

import java.util.Date;

public class NoticeboardVO {
	private int nbNo;
	private String mUserid;
	private int bgNo;
	private String nbTitle;
	private Date nbRegdate;
	private int nbReadcount;
	private String nbContent;
	private String nbDelflag;
	private int fNo1;
	private int fNo2;
	private int fNo3;
	
	
	
	
	
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
	public int getNbNo() {
		return nbNo;
	}
	public void setNbNo(int nbNo) {
		this.nbNo = nbNo;
	}
	public String getmUserid() {
		return mUserid;
	}
	public void setmUserid(String mUserid) {
		this.mUserid = mUserid;
	}
	public int getBgNo() {
		return bgNo;
	}
	public void setBgNo(int bgNo) {
		this.bgNo = bgNo;
	}
	public String getNbTitle() {
		return nbTitle;
	}
	public void setNbTitle(String nbTitle) {
		this.nbTitle = nbTitle;
	}
	public Date getNbRegdate() {
		return nbRegdate;
	}
	public void setNbRegdate(Date nbRegdate) {
		this.nbRegdate = nbRegdate;
	}
	public int getNbReadcount() {
		return nbReadcount;
	}
	public void setNbReadcount(int nbReadcount) {
		this.nbReadcount = nbReadcount;
	}
	public String getNbContent() {
		return nbContent;
	}
	public void setNbContent(String nbContent) {
		this.nbContent = nbContent;
	}
	public String getNbDelflag() {
		return nbDelflag;
	}
	public void setNbDelflag(String nbDelflag) {
		this.nbDelflag = nbDelflag;
	}
	@Override
	public String toString() {
		return "NoticeboardVO [nbNo=" + nbNo + ", mUserid=" + mUserid + ", bgNo=" + bgNo + ", nbTitle=" + nbTitle
				+ ", nbRegdate=" + nbRegdate + ", nbReadcount=" + nbReadcount + ", nbContent=" + nbContent
				+ ", nbDelflag=" + nbDelflag + ", fNo1=" + fNo1 + ", fNo2=" + fNo2 + ", fNo3=" + fNo3 + "]";
	}
	
}
