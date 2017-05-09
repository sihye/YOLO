package com.one.yolo.member.model;

import java.util.List;
import java.util.Map;

import com.one.yolo.common.SearchVO;

public interface MemberDAO {
	public int memberInsert(MemberVO vo);
	public int duplicateUserid(String userid);
	public String selectPwd(String userid);
	public MemberVO selectByUserid(String userid);
	public List<MemberVO> MemberselectByAll();
	public List<Map<String, Object>> ExcelMemberView(SearchVO vo);
	public List<Map<String, Object>> OperatorMemberView();

	public int memberOut(MemberVO vo);

	public List<Map<String, Object>> MemberSelectPG(SearchVO vo);
	public int MemberSeletCount(SearchVO vo);
	public int updateMember(MemberVO vo);
	public List<Map<String , Object>> HostSelectPG(SearchVO vo);
	public int HostSeletCount(SearchVO vo);
	public List<Map<String, Object>> HostExcelView(SearchVO vo);
	public int hostInsert(MemberVO vo);
	
	public String findUserid(MemberVO vo);
	
	public String findPwd(MemberVO vo);

	public MemberVO findPwd1(MemberVO vo);

	public MemberVO adminLoginCheck(String userid);
	
	public int operatorMemberUpdate(MemberVO vo);
	public int operatorHostUpdate(MemberVO vo);


}
