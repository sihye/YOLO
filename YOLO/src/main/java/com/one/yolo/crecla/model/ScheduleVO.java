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
		SC_STARTTIME1 VARCHAR2(500) NULL,     -- 시작시간
		SC_ENDTIME1   VARCHAR2(500) NULL,      -- 종료시간
	    SC_STARTTIME2 VARCHAR2(500) NULL,     -- 시작시간
		SC_ENDTIME2   VARCHAR2(500) NULL ,     -- 종료시간
	    SC_STARTTIME3 VARCHAR2(500) NULL,     -- 시작시간
		SC_ENDTIME4   VARCHAR2(500) NULL      -- 종료시간
	);*/

		private int scNo;
		private int cNo;
		private String scCode;
		private String scStartdate;
		private String scEnddate;
		private String scWeek;
		private String scStarttime1;
		private String scEndtime1;
		private String scStarttime2;
		private String scEndtime2;
		private String scStarttime3;
		private String scEndtime3;
		public int getScNo() {
			return scNo;
		}
		public void setScNo(int scNo) {
			this.scNo = scNo;
		}
		public int getcNo() {
			return cNo;
		}
		public void setcNo(int cNo) {
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
		public String getScStarttime1() {
			return scStarttime1;
		}
		public void setScStarttime1(String scStarttime1) {
			this.scStarttime1 = scStarttime1;
		}
		public String getScEndtime1() {
			return scEndtime1;
		}
		public void setScEndtime1(String scEndtime1) {
			this.scEndtime1 = scEndtime1;
		}
		public String getScStarttime2() {
			return scStarttime2;
		}
		public void setScStarttime2(String scStarttime2) {
			this.scStarttime2 = scStarttime2;
		}
		public String getScEndtime2() {
			return scEndtime2;
		}
		public void setScEndtime2(String scEndtime2) {
			this.scEndtime2 = scEndtime2;
		}
		public String getScStarttime3() {
			return scStarttime3;
		}
		public void setScStarttime3(String scStarttime3) {
			this.scStarttime3 = scStarttime3;
		}
		public String getScEndtime3() {
			return scEndtime3;
		}
		public void setScEndtime3(String scEndtime3) {
			this.scEndtime3 = scEndtime3;
		}
		
		@Override
		public String toString() {
			return "ScheduleVO [scNo=" + scNo + ", cNo=" + cNo + ", scCode=" + scCode + ", scStartdate=" + scStartdate
					+ ", scEnddate=" + scEnddate + ", scWeek=" + scWeek + ", scStarttime1=" + scStarttime1 + ", scEndtime1="
					+ scEndtime1 + ", scStarttime2=" + scStarttime2 + ", scEndtime2=" + scEndtime2 + ", scStarttime3="
					+ scStarttime3 + ", scEndtime3=" + scEndtime3 + "]";
		}
		
		

}
