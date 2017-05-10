package com.one.yolo.member.controller;

import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.yolo.category.model.CategoryService;
import com.one.yolo.category.model.CategoryVO;
import com.one.yolo.categorygroup.model.CategoryGroupService;
import com.one.yolo.categorygroup.model.CategoryGroupVO;
import com.one.yolo.email.EmailSender;
import com.one.yolo.member.model.MemberService;
import com.one.yolo.member.model.MemberVO;


@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger
	=LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;  
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private CategoryGroupService categoryGroupService;
	
	@Autowired
	private EmailSender emailSender;
	
	@RequestMapping("/agreement.do")
	public String agreement(){
		//1
		logger.info("회원약관 화면 보여주기");

		//2

		//3
		return "member/agreement";
	}
	

	@RequestMapping(value="/register.do", method=RequestMethod.GET)
	public String register11(Model model){
		logger.info("회원가입 화면 보여주기");
		

		List<CategoryVO> cList
		=categoryService.selectAll();
		
		List<CategoryGroupVO> cgList
		=categoryGroupService.selectAll();
		
		//카테고리 그룹
		
		//1. 카테고리 그룹 model 
		
		//2. 위로 올라가서 카테고리 그룹 autowired받고
		
		//3. List 에 조회결과 받기 

		//4. 카테고리 그룹이랑 카테고리 비교해서 그룹 삭제할거 삭제하기 . (list.remove(i))
		
		/*for(int i=0; i<cgList.size(); i++){    
	         CategoryGroupVO cgvo = cgList.get(i);      //2   //카테고리 그룹  1  
	         for(int j=0;j<cList.size();j++){                 // 1  // 카테고리 1 1 1              0 1 2
	        	 	CategoryVO cvo = cList.get(i);
	            	if(cgvo.getKgNo() == cvo.getKgNo()){
	            		continue;
	            	}else if(cList.size() == j+1){
	            		cList.remove(i);
	            	}
	               
	         }

	      }*/
		
		//4. 모델통해서 넘겨주기
		model.addAttribute("cList",cList);
		
		model.addAttribute("cgList",cgList);
		
		logger.info("cList size={}",cList.size());
		logger.info("cgList size={}",cgList.size());
		
		
		//- cgList


		//5. 리턴 -> register 뷰파일

		return "member/register";
	}


	@RequestMapping(value="/register.do",method=RequestMethod.POST)
	public String register(@ModelAttribute MemberVO vo, @RequestParam int[] kNo){
		logger.info("회원가입 화면 보여주기");

		
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
			@RequestParam(value="mEmail3" ,required=false) String email3,
			@RequestParam int[] kno,Model model){
		
		for(int i:kno){
			logger.info("kno="+i);
		}
		
		logger.info("kno[0]="+kno[0]);
		//logger.info("kno[1]="+kno[1]);
		
		//체크박스 처리
		switch(kno.length){
		case 1:
			memberVo.setkNo1(kno[0]);
			break;
		case 2:
			memberVo.setkNo1(kno[0]);
			memberVo.setkNo2(kno[1]);
			break;
		case 3:
			memberVo.setkNo1(kno[0]);
			memberVo.setkNo2(kno[1]);
			memberVo.setkNo3(kno[2]);
			break;
		}

		logger.info("kNo1"+memberVo.getkNo1());
		logger.info("kNo2"+memberVo.getkNo2());
		
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
					url="/index2.do";
				}else{
					msg="회원가입 실패";
					url="/member/register.do";
				}

				//3
				model.addAttribute("msg", msg);
				model.addAttribute("url", url);

				return "common/message";
			}
	
	@RequestMapping(value="/findUserid.do",method=RequestMethod.GET)
	public String findUserid_get(){
		logger.info("아이디찾기 보여주기");
		
		return "member/findUserid";
	}
	
	@RequestMapping(value="/findUserid.do")
	   public String findUserid(@RequestParam String mName, @RequestParam String mEmail1, @RequestParam String mEmail2,Model model){
	      logger.info("아이디 찾기");
	      MemberVO memberVo = new MemberVO();
	      memberVo.setmName(mName);
	      memberVo.setmEmail1(mEmail1);
	      memberVo.setmEmail2(mEmail2);
	      String result = memberService.findUserid(memberVo);
	      logger.info("결과 result = {}",result);
	      
	      MemberVO vo = new MemberVO();
	      vo.setmUserid(result);
	   
	      model.addAttribute("result", result);
	      model.addAttribute("mName", mName);
	      model.addAttribute("mEmail1", mEmail1);
	      model.addAttribute("mEmail2", mEmail2);
	      
	      String msg="", url="/index2.do";
			if(result!=null){
				msg=mName+ "님의 아이디는 " +result+" 입니다. 로그인 해주세요.";	
			}else{
				msg="이름 또는 이메일이 일치하지 않습니다";
				url="/member/findUserid.do";
			}
			
			//3
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
			return "common/message";
	      
	      
	   
	   }
	
	@RequestMapping(value="/findPwd.do",method=RequestMethod.GET)
	public String findPwd_get(){
		logger.info("비밀번호찾기 보여주기");
		
		return "member/findPwd";
	}
	
	@RequestMapping(value="/findPwd.do")
	   public String findPwd_post(@RequestParam String mName, @RequestParam String mUserid,
			   Model model){
	      logger.info("비밀번호 찾기");
	      MemberVO memberVo = new MemberVO();
	      memberVo.setmName(mName);
	      memberVo.setmUserid(mUserid);
	      
	      String result = memberService.findPwd(memberVo);
	      
	      logger.info("결과 result = {}",result);
	      
	      MemberVO vo = new MemberVO();

	   
	      model.addAttribute("result", result);
	      model.addAttribute("mName", mName);
	      model.addAttribute("mUserid", mUserid);
	      
	      logger.info(mName);
	      logger.info(mUserid);
	      
	    String msg="", url="";
			if(result==null){
				msg="이름 또는 이메일이 일치하지 않습니다";
				url="/member/findPwd.do";
				
				model.addAttribute("msg", msg);
				model.addAttribute("url", url);
				
				return "common/message";
			}else{
				msg="이름 또는 이메일이 일치";
				
			}
			
			//3
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
			return "member/findPwd1";
	    
	   }
	
	@RequestMapping(value="/findPwd1.do",method=RequestMethod.GET)
	public String findPwd1_get(){
		logger.info("비밀번호찾기 질문 보여주기");
		
		return "member/findPwd1";
	}
	
	@ResponseBody
	@RequestMapping(value="/findPwd1.do")
	   public int findPwd1_post(@ModelAttribute MemberVO memberVo, Model model){
			   
	      logger.info("비밀번호 찾기");
	      /*MemberVO memberVo = new MemberVO();
	      memberVo.setmQuestionanswer(mQuestionanswer);
	      memberVo.setmEmail1(mEmail1);
	      memberVo.setmEmail2(mEmail2);*/
	      
	      MemberVO result1 = memberService.findPwd1(memberVo);
	      /*logger.info("결과 result1 = {}",result1.getmPwd());*/
	      
	      //MemberVO vo = new MemberVO();
	      /*model.addAttribute("result1", result1);
	      model.addAttribute("mQuestionanswer", memberVo.getmQuestionanswer());
	      model.addAttribute("mEmail1", memberVo.getmEmail1());
	      model.addAttribute("mEmail2", memberVo.getmEmail2());*/
	      
	      logger.info(memberVo.getmQuestionanswer());
	      logger.info(memberVo.getmEmail1());
	      logger.info(memberVo.getmEmail2());
	     //url="/index2.do"; 
	     
	    String msg="", url="";
	    	
			if(result1 != null){
				
				logger.info("이메일 발송 처리");
			      String subject="비밀번호 문의에 대한 답변입니다.";
			      String content=result1.getmName()+"님의 비밀번호는 [ "+result1.getmPwd()+" ] 입니다.";
			      String receiver=memberVo.getmEmail1()+"@"+memberVo.getmEmail2();
			      String sender="admin@herbmall.com";
			      
			      try {
			         emailSender.sendEmail(subject, content, receiver, sender);
			         logger.info("이메일 발송 성공");
			         
			         model.addAttribute("msg", "asfgasgfasg");
					 model.addAttribute("url", "/index2.do");
					 
					 return 1;
			      } catch (MessagingException e) {
			         logger.info("이메일 발송 실패");
			         e.printStackTrace();
			         
			         return 2;
			      }

			}else{
				return 2;
			}
			//3
			/*model.addAttribute("msg", msg);
			model.addAttribute("url", url);*/

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
	
	@RequestMapping(value="/memberOut.do", method=RequestMethod.POST)
	public String out_post(@ModelAttribute MemberVO vo,String pwd,
			HttpSession session, HttpServletResponse response, 
			Model model){
		String userid=(String) session.getAttribute("userid");
		logger.info("회원탈퇴 처리, 파라미터 userid={},pwd={}", userid,pwd);
		logger.info("reason={}",vo.getmReason());
		
		int result 
		= memberService.loginCheck(userid,pwd);
		String msg="", url="/member/memberOut.do";

		if(result==MemberService.LOGIN_OK){
			vo.setmUserid(userid);
			int cnt = memberService.memberOut(vo);
			logger.info("회원탈퇴 결과, cnt={}", cnt);
			if(cnt>0){
				session.invalidate();
				
				//쿠키 삭제
				Cookie ck = new Cookie("ck_userid", userid);
				ck.setPath("/");
				ck.setMaxAge(0); 
				response.addCookie(ck);
				
				msg="회원 탈퇴처리되었습니다.";
				url="/index2.do";
			}else{
				msg="회원탈퇴 실패";
			}
		}else if(result==MemberService.PWD_DISAGREE){
			msg="비밀번호가 일치하지 않습니다.";
		}else{
			msg="비밀번호 체크 에러";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
}
