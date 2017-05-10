package com.one.yolo.booking.model;

import java.sql.Timestamp;

import com.one.yolo.common.SearchVO;

public class BookingVO extends SearchVO{
	/*CREATE TABLE booking (
	BK_NO       NUMBER        NOT NULL, -- 예약번호
	BK_USERID   VARCHAR2(500) NOT NULL, -- 아이디
	SC_NO       NUMBER        NOT NULL, -- 스케줄번호
	BK_DATE     DATE          DEFAULT sysdate, -- 예약일
	BK_BDATE    VARCHAR2(500) NOT NULL,  --클래스 예약일
	BK_TIME     VARCHAR2(500) NULL,     -- 예약시간
	BK_ENDCHECK VARCHAR2(500) DEFAULT 'N' -- 종료유무
);*/

	private int bkNo;
	private String bk_Userid;
	private String scNo;
	private Timestamp bkDate;
	private String bkBdate;
	private String bkTime;
	private String bkEndchek;
	
	
	
	
	public int getBkNo() {
		return bkNo;
	}
	public void setBkNo(int bkNo) {
		this.bkNo = bkNo;
	}
	public String getBk_Userid() {
		return bk_Userid;
	}
	public void setBk_Userid(String bk_Userid) {
		this.bk_Userid = bk_Userid;
	}
	public String getScNo() {
		return scNo;
	}
	public void setScNo(String scNo) {
		this.scNo = scNo;
	}
	public Timestamp getBkDate() {
		return bkDate;
	}
	public void setBkDate(Timestamp bkDate) {
		this.bkDate = bkDate;
	}
	public String getBkBdate() {
		return bkBdate;
	}
	public void setBkBdate(String bkBdate) {
		this.bkBdate = bkBdate;
	}
	public String getBkTime() {
		return bkTime;
	}
	public void setBkTime(String bkTime) {
		this.bkTime = bkTime;
	}
	public String getBkEndchek() {
		return bkEndchek;
	}
	public void setBkEndchek(String bkEndchek) {
		this.bkEndchek = bkEndchek;
	}
	@Override
	public String toString() {
		return "BookingVO [bkNo=" + bkNo + ", bk_Userid=" + bk_Userid + ", scNo=" + scNo + ", bkDate=" + bkDate
				+ ", bkBdate=" + bkBdate + ", bkTime=" + bkTime + ", bkEndchek=" + bkEndchek + ", getFlNo()="
				+ getFlNo() + ", getUserid()=" + getUserid() + ", getPmCancelcheck()=" + getPmCancelcheck()
				+ ", getSearchStartDate()=" + getSearchStartDate() + ", getSearchEndDate()=" + getSearchEndDate()
				+ ", getSearchCondition()=" + getSearchCondition() + ", getSearchKeyword()=" + getSearchKeyword()
				+ ", getSearchUseYn()=" + getSearchUseYn() + ", getCurrentPage()=" + getCurrentPage()
				+ ", getBlockSize()=" + getBlockSize() + ", getFirstRecordIndex()=" + getFirstRecordIndex()
				+ ", getLastRecordIndex()=" + getLastRecordIndex() + ", getRecordCountPerPage()="
				+ getRecordCountPerPage() + ", toString()=" + super.toString() + ", getSearchKno()=" + getSearchKno()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}
	


}
