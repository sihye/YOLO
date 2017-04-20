package com.one.yolo.member.model;

import java.util.List;
import java.util.Map;

public interface MemberDAO {
	public int memberInsert(MemberVO vo);
	public int duplicateUserid(String userid);
	public String selectPwd(String userid);
	public MemberVO selectByUserid(String userid);
	public List<MemberVO> MemberselectByAll();
	public List<Map<String, Object>> ExcelMemberView();
	public List<Map<String, Object>> OperatorMemberView();

}
