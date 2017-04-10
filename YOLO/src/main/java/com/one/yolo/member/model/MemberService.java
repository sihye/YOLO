package com.one.yolo.member.model;

public interface MemberService {
	//아이디 중복확인에서 사용하는 상수
	public static final int EXIST_ID=1;  //이미 해당 아이디가 존재함
	public static final int NONE_EXIST_ID=2; //아이디가 존재하지 않음
	
	//로그인 처리에 사용하는 상수
	public static final int LOGIN_OK=1;  //로그인 성공
	public static final int ID_NONE=2;   //아이디가 없는 경우
	public static final int PWD_DISAGREE=3; //비밀번호가 일치하지 않는 경우
	
}
