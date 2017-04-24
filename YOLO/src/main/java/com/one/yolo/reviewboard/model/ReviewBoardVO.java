package com.one.yolo.reviewboard.model;

import java.util.Date;

public class ReviewBoardVO {
	private int cbNo;			//후기번호
	private int cNo;			//클래스번호
	private String mUserid;		//아이디
	private String cbTitle;		//제목
	private Date cbRegdate;		//등록일
	private int cbReadcount;	//조회수	
	private String cbContent;	//내용
	private int cbGrade;		//평점
	private String cbFilename;	//파일명
	private String cName;		//클래스명
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
	public Date getCbRegdate() {
		return cbRegdate;
	}
	public void setCbRegdate(Date cbRegdate) {
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
	public int getCbGrade() {
		return cbGrade;
	}
	public void setCbGrade(int cbGrade) {
		this.cbGrade = cbGrade;
	}
	public String getCbFilename() {
		return cbFilename;
	}
	public void setCbFilename(String cbFilename) {
		this.cbFilename = cbFilename;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	
	@Override
	public String toString() {
		return "ReviewBoardVO [cbNo=" + cbNo + ", cNo=" + cNo + ", mUserid=" + mUserid + ", cbTitle=" + cbTitle
				+ ", cbRegdate=" + cbRegdate + ", cbReadcount=" + cbReadcount + ", cbContent=" + cbContent
				+ ", cbGrade=" + cbGrade + ", cbFilename=" + cbFilename + ", cName=" + cName + "]";
	}
}
