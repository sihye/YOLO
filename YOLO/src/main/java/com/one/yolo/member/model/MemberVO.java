package com.one.yolo.member.model;

import java.sql.Timestamp;

public class MemberVO {
	
	private String mUserid;
	private int mgNo2;
	private int mN0;
	private String mPwd;
	private String mName;
	private String mEmail;
	private String mAddress;
	private String mBankName;
	private String mAccount;
	private Timestamp mJoindate;
	private Timestamp mLeavedate;
	private int kNo1;
	private int kNo2;
	private int kNo3;
	private String mTel;
	private int qQuestionno;
	private String mQuestionanswer;
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
	public int getmN0() {
		return mN0;
	}
	public void setmN0(int mN0) {
		this.mN0 = mN0;
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
	public String getmEmail() {
		return mEmail;
	}
	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}
	public String getmAddress() {
		return mAddress;
	}
	public void setmAddress(String mAddress) {
		this.mAddress = mAddress;
	}
	public String getmBankName() {
		return mBankName;
	}
	public void setmBankName(String mBankName) {
		this.mBankName = mBankName;
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
	public String getmTel() {
		return mTel;
	}
	public void setmTel(String mTel) {
		this.mTel = mTel;
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
	@Override
	public String toString() {
		return "MemberVO [mUserid=" + mUserid + ", mgNo2=" + mgNo2 + ", mN0=" + mN0 + ", mPwd=" + mPwd + ", mName="
				+ mName + ", mEmail=" + mEmail + ", mAddress=" + mAddress + ", mBankName=" + mBankName + ", mAccount="
				+ mAccount + ", mJoindate=" + mJoindate + ", mLeavedate=" + mLeavedate + ", kNo1=" + kNo1 + ", kNo2="
				+ kNo2 + ", kNo3=" + kNo3 + ", mTel=" + mTel + ", qQuestionno=" + qQuestionno + ", mQuestionanswer="
				+ mQuestionanswer + "]";
	}

	
	
}
