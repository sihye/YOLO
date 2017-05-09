package com.one.yolo.member.model;

import java.sql.Timestamp;

public class MemberVO {
	
	private String mUserid;
	private int mgNo2;
	private int mNo;
	private String mPwd;
	private String mName;
	private String mEmail1;
	private String mEmail2;
	private String mAddress;  
	private String mAddressdetail;
	private String mBankname;
	private String mAccount;
	private Timestamp mJoindate;
	private Timestamp mLeavedate;
	private int kNo1; 
	private int kNo2;
	private int kNo3;
	private String mTel1;
	private String mTel2;
	private String mTel3;
	private int qQuestionno;
	private String mQuestionanswer;
	private String mBirth;
	private String mGender;
	private String mReason;
	

	
	
	
	public String getmUserid() {
		return mUserid;
	}
	public void setmUserid(String mUserid) {
		this.mUserid = mUserid;
	}
	public int getMgNo2() {
		return mgNo2;
	}
	public void setMgNo2(int mgNo2) {
		this.mgNo2 = mgNo2;
	}
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	public String getmPwd() {
		return mPwd;
	}
	public void setmPwd(String mPwd) {
		this.mPwd = mPwd;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmEmail1() {
		return mEmail1;
	}
	public void setmEmail1(String mEmail1) {
		this.mEmail1 = mEmail1;
	}
	public String getmEmail2() {
		return mEmail2;
	}
	public void setmEmail2(String mEmail2) {
		this.mEmail2 = mEmail2;
	}
	public String getmAddress() {
		return mAddress;
	}
	public void setmAddress(String mAddress) {
		this.mAddress = mAddress;
	}
	public String getmAddressdetail() {
		return mAddressdetail;
	}
	public void setmAddressdetail(String mAddressdetail) {
		this.mAddressdetail = mAddressdetail;
	}
	public String getmBankname() {
		return mBankname;
	}
	public void setmBankname(String mBankname) {
		this.mBankname = mBankname;
	}
	public String getmAccount() {
		return mAccount;
	}
	public void setmAccount(String mAccount) {
		this.mAccount = mAccount;
	}
	public Timestamp getmJoindate() {
		return mJoindate;
	}
	public void setmJoindate(Timestamp mJoindate) {
		this.mJoindate = mJoindate;
	}
	public Timestamp getmLeavedate() {
		return mLeavedate;
	}
	public void setmLeavedate(Timestamp mLeavedate) {
		this.mLeavedate = mLeavedate;
	}
	public int getkNo1() {
		return kNo1;
	}
	public void setkNo1(int kNo1) {
		this.kNo1 = kNo1;
	}
	public int getkNo2() {
		return kNo2;
	}
	public void setkNo2(int kNo2) {
		this.kNo2 = kNo2;
	}
	public int getkNo3() {
		return kNo3;
	}
	public void setkNo3(int kNo3) {
		this.kNo3 = kNo3;
	}
	public String getmTel1() {
		return mTel1;
	}
	public void setmTel1(String mTel1) {
		this.mTel1 = mTel1;
	}
	public String getmTel2() {
		return mTel2;
	}
	public void setmTel2(String mTel2) {
		this.mTel2 = mTel2;
	}
	public String getmTel3() {
		return mTel3;
	}
	public void setmTel3(String mTel3) {
		this.mTel3 = mTel3;
	}
	public int getqQuestionno() {
		return qQuestionno;
	}
	public void setqQuestionno(int qQuestionno) {
		this.qQuestionno = qQuestionno;
	}
	public String getmQuestionanswer() {
		return mQuestionanswer;
	}
	public void setmQuestionanswer(String mQuestionanswer) {
		this.mQuestionanswer = mQuestionanswer;
	}
	public String getmBirth() {
		return mBirth;
	}
	public void setmBirth(String mBirth) {
		this.mBirth = mBirth;
	}
	public String getmGender() {
		return mGender;
	}
	public void setmGender(String mGender) {
		this.mGender = mGender;
	}
	public String getmReason() {
		return mReason;
	}
	public void setmReason(String mReason) {
		this.mReason = mReason;
	}
	@Override
	public String toString() {
		return "MemberVO [mUserid=" + mUserid + ", mgNo2=" + mgNo2 + ", mNo=" + mNo + ", mPwd=" + mPwd + ", mName="
				+ mName + ", mEmail1=" + mEmail1 + ", mEmail2=" + mEmail2 + ", mAddress=" + mAddress
				+ ", mAddressdetail=" + mAddressdetail + ", mBankname=" + mBankname + ", mAccount=" + mAccount
				+ ", mJoindate=" + mJoindate + ", mLeavedate=" + mLeavedate + ", kNo1=" + kNo1 + ", kNo2=" + kNo2
				+ ", kNo3=" + kNo3 + ", mTel1=" + mTel1 + ", mTel2=" + mTel2 + ", mTel3=" + mTel3 + ", qQuestionno="
				+ qQuestionno + ", mQuestionanswer=" + mQuestionanswer + ", mBirth=" + mBirth + ", mGender=" + mGender
				+ ", mReason=" + mReason + "]";
	}
	
	
	
}
