package com.one.yolo.crecla.model;

import java.sql.Timestamp;

import com.one.yolo.member.model.MemberVO;

public class ClassVO extends MemberVO {
	/*CREATE TABLE Class (
   C_NO         NUMBER        NOT NULL, -- 클래스번호
   M_USERID     VARCHAR2(500) NOT NULL, -- 호스트아이디
   K_NO         NUMBER        NOT NULL, -- 카테고리번호
   C_NAME       VARCHAR2(500) NOT NULL, -- 클래스명
   C_PRICE      NUMBER        DEFAULT 0 not NULL     , -- 비용
   C_GOAL       VARCHAR2(500) NULL,     -- 목표
   C_TARGET     VARCHAR2(500) NULL,     -- 대상
   C_SPEVIALTY  VARCHAR2(500) NULL,     -- 특기사항
   C_DETAILINFO clob NULL,     -- 상세정보
   C_PLACE     VARCHAR2(500) NOT NULL, -- 장소
   C_PLACEDETAIL   VARCHAR2(500) NOT NULL, -- 상세주소
   C_coordinate VARCHAR2(500) NOT NULL, --좌표
   C_MAINIMG    VARCHAR2(500) not null,     -- 메인이미지
   C_DETAILIMG1 VARCHAR2(500) NULL,     -- 상세이미지1
   C_DETAILIMG2 VARCHAR2(500) NULL,     -- 상세이미지2
   C_DETAILIMG3 VARCHAR2(500) NULL,     -- 상세이미지3
   C_PAYMENTWAY VARCHAR2(500) not null,     -- 결제방법
   C_MAXPERSON  VARCHAR2(500) NULL,     -- 최대인원
   C_HITS       NUMBER        DEFAULT 0, -- 조회수
   C_DEL        VARCHAR2(5)   DEFAULT 'N', -- 삭제여부
   C_REGDATE    DATE          DEFAULT sysdate-- 등록일
);*/
	private int cNo;
	private String mUserid;
	private int kNo;
	private String cName;
	private int cPrice;//비용
	private String cGoal; //목표
	private String cTarget; //대상
	private String cSpevialty;//특기사항
	private String cDetailinfo;//상세정보
	private String cPlace;//장소
	private String cplacedetail;//좌표
	private String cMainimg;//커버이미지
	private String cDetailimg1;//상세1
	private String cDetailimg2;//상세2
	private String cDetailimg3;//상세3
	private String cPaymentway;//결제방법
	private String cMaxperson;//최대인원
	private Timestamp cRegdate;//등록일
	private int cHits;//조회수
	private String cDel;//삭제여부
	private String cCoordinate;
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
	public int getkNo() {
		return kNo;
	}
	public void setkNo(int kNo) {
		this.kNo = kNo;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public int getcPrice() {
		return cPrice;
	}
	public void setcPrice(int cPrice) {
		this.cPrice = cPrice;
	}
	public String getcGoal() {
		return cGoal;
	}
	public void setcGoal(String cGoal) {
		this.cGoal = cGoal;
	}
	public String getcTarget() {
		return cTarget;
	}
	public void setcTarget(String cTarget) {
		this.cTarget = cTarget;
	}
	public String getcSpevialty() {
		return cSpevialty;
	}
	public void setcSpevialty(String cSpevialty) {
		this.cSpevialty = cSpevialty;
	}
	public String getcDetailinfo() {
		return cDetailinfo;
	}
	public void setcDetailinfo(String cDetailinfo) {
		this.cDetailinfo = cDetailinfo;
	}
	public String getcMainimg() {
		return cMainimg;
	}
	public void setcMainimg(String cMainimg) {
		this.cMainimg = cMainimg;
	}
	public String getcDetailimg1() {
		return cDetailimg1;
	}
	public void setcDetailimg1(String cDetailimg1) {
		this.cDetailimg1 = cDetailimg1;
	}
	public String getcDetailimg2() {
		return cDetailimg2;
	}
	public void setcDetailimg2(String cDetailimg2) {
		this.cDetailimg2 = cDetailimg2;
	}
	public String getcDetailimg3() {
		return cDetailimg3;
	}
	public void setcDetailimg3(String cDetailimg3) {
		this.cDetailimg3 = cDetailimg3;
	}
	public String getcPaymentway() {
		return cPaymentway;
	}
	public void setcPaymentway(String cPaymentway) {
		this.cPaymentway = cPaymentway;
	}
	public String getcMaxperson() {
		return cMaxperson;
	}
	public void setcMaxperson(String cMaxperson) {
		this.cMaxperson = cMaxperson;
	}
	public Timestamp getcRegdate() {
		return cRegdate;
	}
	public void setcRegdate(Timestamp cRegdate) {
		this.cRegdate = cRegdate;
	}
	public int getcHits() {
		return cHits;
	}
	public void setcHits(int cHits) {
		this.cHits = cHits;
	}
	public String getcDel() {
		return cDel;
	}
	public void setcDel(String cDel) {
		this.cDel = cDel;
	}

	public String getcPlace() {
		return cPlace;
	}
	public void setcPlace(String cPlace) {
		this.cPlace = cPlace;
	}
	public String getCplacedetail() {
		return cplacedetail;
	}
	public void setCplacedetail(String cplacedetail) {
		this.cplacedetail = cplacedetail;
	}
	public String getcCoordinate() {
		return cCoordinate;
	}
	public void setcCoordinate(String cCoordinate) {
		this.cCoordinate = cCoordinate;
	}
	@Override
	public String toString() {
		return "ClassVO [cNo=" + cNo + ", mUserid=" + mUserid + ", kNo=" + kNo + ", cName=" + cName + ", cPrice="
				+ cPrice + ", cGoal=" + cGoal + ", cTarget=" + cTarget + ", cSpevialty=" + cSpevialty + ", cDetailinfo="
				+ cDetailinfo + ", cPlace=" + cPlace + ", cplacedetail=" + cplacedetail + ", cMainimg=" + cMainimg
				+ ", cDetailimg1=" + cDetailimg1 + ", cDetailimg2=" + cDetailimg2 + ", cDetailimg3=" + cDetailimg3
				+ ", cPaymentway=" + cPaymentway + ", cMaxperson=" + cMaxperson + ", cRegdate=" + cRegdate + ", cHits="
				+ cHits + ", cDel=" + cDel + ", cCoordinate=" + cCoordinate + ", getMgNo2()=" + getMgNo2()
				+ ", getmNo()=" + getmNo() + ", getmPwd()=" + getmPwd() + ", getmName()=" + getmName()
				+ ", getmEmail1()=" + getmEmail1() + ", getmEmail2()=" + getmEmail2() + ", getmAddress()="
				+ getmAddress() + ", getmAddressdetail()=" + getmAddressdetail() + ", getmBankname()=" + getmBankname()
				+ ", getmAccount()=" + getmAccount() + ", getmJoindate()=" + getmJoindate() + ", getmLeavedate()="
				+ getmLeavedate() + ", getkNo1()=" + getkNo1() + ", getkNo2()=" + getkNo2() + ", getkNo3()=" + getkNo3()
				+ ", getmTel1()=" + getmTel1() + ", getmTel2()=" + getmTel2() + ", getmTel3()=" + getmTel3()
				+ ", getqQuestionno()=" + getqQuestionno() + ", getmQuestionanswer()=" + getmQuestionanswer()
				+ ", getmBirth()=" + getmBirth() + ", getmGender()=" + getmGender() + ", getmReason()=" + getmReason()
				+ ", toString()=" + super.toString() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ "]";
	}
	
	
	
	
}
