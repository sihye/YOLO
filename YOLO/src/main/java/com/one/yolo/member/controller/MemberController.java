package com.one.yolo.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.one.yolo.member.model.MemberService;
import com.one.yolo.member.model.MemberVO;

import oracle.net.aso.k;



@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger
	=LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;

	
	
	@RequestMapping(value="/register.do",method=RequestMethod.GET)
	public String register(){
		
		return "member/register";
	}

	
	
	
	@RequestMapping(value="/register.do",method=RequestMethod.POST)
	public String register(@ModelAttribute MemberVO vo, @RequestParam int[] kNo){
		logger.info("회원가입 화면 보여주기");

		if(kNo !=null){
			if(kNo[0]>0){ 
				vo.setkNo1(kNo[0]);
			}
			if(kNo[1]>0){
				vo.setkNo2(kNo[1]);
			}
			if(kNo[2]>0){
				vo.setkNo3(kNo[2]);
			}
			
		}
		
		int cnt = memberService.memberInsert(vo);
		String msg ="", url ="/index.do";
		if(cnt>0){
			msg ="회원가입 완료";
		}else{
			msg ="회원가입 실패";
		}
		return "common/message";
	}
	
	@RequestMapping("/join.do")
	public String join(@ModelAttribute MemberVO memberVo,
			@RequestParam(value="email3" ,required=false) String email3,Model model){
		//1
		logger.info("회원가입 처리, 파라미터 vo={}", memberVo);
		
		//2
				//휴대폰 입력하지 않은 경우 처리
				String hp2=memberVo.getmTel2();
				String hp3=memberVo.getmTel3();
				if(hp2==null || hp2.isEmpty() || hp3==null || hp3.isEmpty()){
					memberVo.setmTel1("");
					memberVo.setmTel2("");
					memberVo.setmTel3("");
				}

				//이메일 입력하지 않은 경우 처리
				String email1=memberVo.getmEmail1();

				if(email1==null || email1.isEmpty()){
					memberVo.setmEmail2(""); 
				}else{
					//직접입력인 경우 
					if(memberVo.getmEmail2().equals("etc")){
						if(email3 !=null && !email3.isEmpty()){
							memberVo.setmEmail2(email3);
						}else{
							memberVo.setmEmail1("");
							memberVo.setmEmail2("");
						}
					}
				}

				int cnt = memberService.memberInsert(memberVo);
				String msg="", url="";
				if(cnt>0){
					msg="회원가입되었습니다";
					url="/index.do";
				}else{
					msg="회원가입 실패";
					url="/member/register.do";
				}

				//3
				model.addAttribute("msg", msg);
				model.addAttribute("url", url);

				return "common/message";
			}
	
	@RequestMapping("/checkUserid.do")
	public String checkUserid(@RequestParam String userid,
			Model model){
		//1
		logger.info("아이디 중복확인, 파라미터 userid={}", userid);

		//2
		int result=0;
		if(userid!=null && !userid.isEmpty()){
			result = memberService.duplicateUserid(userid);
			logger.info("아이디 중복확인 결과 result={}", result);
		}

		//3
		model.addAttribute("result", result);
		model.addAttribute("EXIST_ID", MemberService.EXIST_ID);
		model.addAttribute("NONE_EXIST_ID", MemberService.NONE_EXIST_ID);

		return "member/checkUserid";
	}
	
	@RequestMapping(value="/memberOut.do",method=RequestMethod.GET)
	public String out_get(){
		logger.info("회원탈퇴화면 보여주기");
		
		return "member/memberOut";
	}
}
