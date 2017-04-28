package com.one.yolo.crecla.model;

public class ScheduleVO {
/*-- 스케줄
CREATE TABLE classschedule (
	SC_NO        NUMBER        NOT NULL, -- 스케줄번호
	C_NO         NUMBER        NOT NULL, -- 클래스번호
	SC_CODE      VARCHAR2(500) NOT NULL, -- 스케줄구분
	SC_STARTDATE VARCHAR2(500) NULL,     -- 시작일
	SC_ENDDATE   VARCHAR2(500) NULL,     -- 종료일
	SC_WEEK      VARCHAR2(500) NULL,     -- 요일
	SC_STARTTIME VARCHAR2(500) NULL,     -- 시작시간
	SC_ENDTIME   VARCHAR2(500) NULL      -- 종료시간
);*/

	private int scNo;
	private int cNo;
	private String scCode;
	private String scStartdate;
	private String scEnddate;
	private String scWeek;
	private String scStarttime;
	private String scEndtime;
	public int getScNo() {
		return scNo;
	}
	public void setScNo(int scNo) {
		this.scNo = scNo;
	}
	public int getC_No() {
		return cNo;
	}
	public void setC_No(int cNo) {
		this.cNo = cNo;
	}
	public String getScCode() {
		return scCode;
	}
	public void setScCode(String scCode) {
		this.scCode = scCode;
	}
	public String getScStartdate() {
		return scStartdate;
	}
	public void setScStartdate(String scStartdate) {
		this.scStartdate = scStartdate;
	}
	public String getScEnddate() {
		return scEnddate;
	}
	public void setScEnddate(String scEnddate) {
		this.scEnddate = scEnddate;
	}
	public String getScWeek() {
		return scWeek;
	}
	public void setScWeek(String scWeek) {
		this.scWeek = scWeek;
	}
	public String getScStarttime() {
		return scStarttime;
	}
	public void setScStarttime(String scStarttime) {
		this.scStarttime = scStarttime;
	}
	public String getScEndtime() {
		return scEndtime;
	}
	public void setScEndtime(String scEndtime) {
		this.scEndtime = scEndtime;
	}
	@Override
	public String toString() {
		return "ScheduleVO [scNo=" + scNo + ", c_No=" + cNo + ", scCode=" + scCode + ", scStartdate=" + scStartdate
				+ ", scEnddate=" + scEnddate + ", scWeek=" + scWeek + ", scStarttime=" + scStarttime + ", scEndtime="
				+ scEndtime + "]";
	}
	
	

}
