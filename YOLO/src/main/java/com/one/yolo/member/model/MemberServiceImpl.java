package com.one.yolo.member.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	
}
