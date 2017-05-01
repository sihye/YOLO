package com.one.yolo.useboard.model;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import com.one.yolo.common.SearchVO;

@Alias("useboardVO")
public class UseboardVO extends SearchVO {
	private int ubNo;       	//게시판번호      
	private String mUserid;		//운영자아이디
	private int bgNo;			//게시판분류번호
	private String ubTitle;    	//제목
	private Date ubRegdate;		//등록일
	private int ubReadcount;	//조회수
	private String ubContent;	//내용
	private String ubDelflag;	//삭제구분
	private int ubType =1;		//리스트구분
	
	
	@Override
	public String toString() {
		return "UseboardVO [ubNo=" + ubNo + ", mUserid=" + mUserid + ", bgNo=" + bgNo + ", ubTitle=" + ubTitle
				+ ", ubRegdate=" + ubRegdate + ", ubReadcount=" + ubReadcount + ", ubContent=" + ubContent
				+ ", ubDelflag=" + ubDelflag + ", ubType=" + ubType + "]";
	}
	public int getUbNo() {
		return ubNo;
	}
	public void setUbNo(int ubNo) {
		this.ubNo = ubNo;
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
	public String getUbTitle() {
		return ubTitle;
	}
	public void setUbTitle(String ubTitle) {
		this.ubTitle = ubTitle;
	}
	public Date getUbRegdate() {
		return ubRegdate;
	}
	public void setUbRegdate(Date ubRegdate) {
		this.ubRegdate = ubRegdate;
	}
	public int getUbReadcount() {
		return ubReadcount;
	}
	public void setUbReadcount(int ubReadcount) {
		this.ubReadcount = ubReadcount;
	}
	public String getUbContent() {
		return ubContent;
	}
	public void setUbContent(String ubContent) {
		this.ubContent = ubContent;
	}
	public String getUbDelflag() {
		return ubDelflag;
	}
	public void setUbDelflag(String ubDelflag) {
		this.ubDelflag = ubDelflag;
	}
	public int getUbType() {
		return ubType;
	}
	public void setUbType(int ubType) {
		this.ubType = ubType;
	}

	

	
}
