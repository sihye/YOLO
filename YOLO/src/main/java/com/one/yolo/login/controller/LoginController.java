package com.one.yolo.login.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.one.yolo.member.model.MemberService;
import com.one.yolo.member.model.MemberVO;

@Controller
@RequestMapping("/login")
public class LoginController {
	private static final Logger logger
	=LoggerFactory.getLogger(LoginController.class);
	
	private MemberService memberService;

	@RequestMapping(value="/login.do",method=RequestMethod.GET)
	public String login_get(){
		logger.info("로그인 화면 보여주기");
		
		return "login/login";
	};
	
	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	public String login_post(@RequestParam String userid,@RequestParam String pwd,Model model,
								@RequestParam(required=false)String chkSaveId,
								HttpServletRequest request,HttpServletResponse response){
		//1.
		logger.info("로그인 처리 파라미터 userid={} pwd={}",userid,pwd);
		logger.info("파라미터 chkSaveId={}", chkSaveId);
		
		//2
		int result = memberService.loginCheck(userid, pwd);
		logger.info("로그인 처리 결과, result={}", result);
		
		String msg="", url="/login/login.do";
		
		if(result==memberService.LOGIN_OK){
			MemberVO vo=memberService.selectByUserid(userid);
			
			msg=vo.getmName()+"님이 로그인되었습니다";
			url="/index.do";
			
			//세션에 저장
			HttpSession session=request.getSession();
			session.setAttribute("userid",userid);
			session.setAttribute("userName",vo.getmName());
			
			//쿠키에 저장
			Cookie ck=new Cookie("ck_userid",userid);
			ck.setPath("/");
			
			//아이디 저장하기 체크한경우
			if(chkSaveId!=null){
				ck.setMaxAge(100*24*60*60);//100일
				response.addCookie(ck);
			}else{
				ck.setMaxAge(0);//쿠키 삭제
				response.addCookie(ck);
			}
			
		}else if(result==MemberService.ID_NONE){
			msg="해당 아이디가 존재하지 않습니다";
		}else if(result==MemberService.PWD_DISAGREE){
			msg="비밀번호가 일치하지 않습니다";
		}else{
			msg="로그인 체크 실패";
		}
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session){
		logger.info("로그아웃 처리,파라미터");
		
		session.invalidate();
		
		return "redirect:/index.do";
	}

	
}
