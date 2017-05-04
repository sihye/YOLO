package com.one.yolo.member.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.yolo.common.SearchVO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO memberDao;
	
	@Override
	public int memberInsert(MemberVO vo) {
		return memberDao.memberInsert(vo);
	}

	@Override
	public int duplicateUserid(String userid) {
		int result=0;
		int count=memberDao.duplicateUserid(userid);
		
		if(count>0){
			result = EXIST_ID;  //이미 해당아이디 존재
		}else{
			result = NONE_EXIST_ID;
		}
		
		return result;
	}

	@Override
	public int loginCheck(String userid, String pwd) {
		int result=0;
		String dbPwd =memberDao.selectPwd(userid);
		
		if(dbPwd!=null && !dbPwd.isEmpty()){
			//아이디는 존재
			if(pwd.equals(dbPwd)){
				result=LOGIN_OK;  //비밀번호도 일치-로그인 성공
			}else{
				result=PWD_DISAGREE; //비밀번호 불일치
			}			
		}else{  //해당 아이디가 없는 경우
			result=ID_NONE;
		}
		
		return result;
	}

	@Override
	public MemberVO selectByUserid(String userid) {
		return memberDao.selectByUserid(userid);
	}

	@Override
	public List<MemberVO> MemberselectByAll() {
		
		return memberDao.MemberselectByAll();
	}

	@Override
	public List<Map<String, Object>> ExcelMemberView(SearchVO vo) {
		return memberDao.ExcelMemberView(vo);
	}

	@Override
	public List<Map<String, Object>> OperatorMemberView() {

		return memberDao.OperatorMemberView();
	}

	@Override

	public int memberOut(MemberVO vo) {

		return memberDao.memberOut(vo);
	}

	public List<Map<String, Object>> MemberSelectPG(SearchVO vo) {
	
		return memberDao.MemberSelectPG(vo);
	}

	@Override
	public int MemberSeletCount(SearchVO vo) {
	
		return memberDao.MemberSeletCount(vo);
	}

	@Override
	public int updateMember(MemberVO vo) {
		return memberDao.updateMember(vo);
	}

	@Override
	public List<Map<String, Object>> HostSelectPG(SearchVO vo) {
		return memberDao.HostSelectPG(vo);
	}

	@Override
	public int HostSeletCount(SearchVO vo) {
		return memberDao.HostSeletCount(vo);
	}

	@Override
	public List<Map<String, Object>> HostExcelView(SearchVO vo) {
		return memberDao.HostExcelView(vo);
	}

	@Override
	public int hostInsert(MemberVO vo) {
		return memberDao.hostInsert(vo);
	}

	@Override
	public String findUserid(MemberVO vo) {
		return memberDao.findUserid(vo);
	}
	
	
	
	
	
	
	
}
