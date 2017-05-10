package com.one.yolo.mypage.controller;

import java.util.List;

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

import com.one.yolo.category.model.CategoryService;
import com.one.yolo.category.model.CategoryVO;
import com.one.yolo.categorygroup.model.CategoryGroupService;
import com.one.yolo.categorygroup.model.CategoryGroupVO;
import com.one.yolo.member.model.MemberService;
import com.one.yolo.member.model.MemberVO;

@Controller
@RequestMapping("/mypage/myedit")
public class MyEditController {
		
	private static final Logger logger
	=LoggerFactory.getLogger(MyEditController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private CategoryGroupService categoryGroupService;
	
	@RequestMapping(value="/myedit.do", method=RequestMethod.GET)
	public String myedit_get(HttpSession session,Model model){
		String userid=(String) session.getAttribute("userid");
		logger.info("회원수정화면 보여주기 123, 파라미터 userid={}", userid);
	
		MemberVO vo =memberService.selectByUserid(userid);
		logger.info("회원수정화면123 - 회원정보조회 결과, vo={}", vo);
		
		List<CategoryVO> cList
		=categoryService.selectAll();
		
		List<CategoryGroupVO> cgList
		=categoryGroupService.selectAll();

		logger.info("123cList size={}",cList.size());
		logger.info("123cgList size={}",cgList.size());
	
		model.addAttribute("vo", vo);
		model.addAttribute("cList",cList);
		model.addAttribute("cgList",cgList);
	
		return "mypage/myedit/myedit";
	}
	@RequestMapping(value="/myedit.do", method=RequestMethod.POST)
	public String myedit_post(@ModelAttribute MemberVO memberVo,
			@RequestParam(value="mEmail3" ,required=false) String email3,
			@RequestParam int[] kno,
			HttpSession session, Model model){
		logger.info("회원수정 처리, 파라미터 vo={}", memberVo);
		String userid=(String) session.getAttribute("userid");
		memberVo.setmUserid(userid);

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
					msg="회원정보 수정";
					url="/index2.do";
				}else{
					msg="회원정보 수정실패";
					url="/member/register.do";
				}

				//3
				model.addAttribute("msg", msg);
				model.addAttribute("url", url);

				return "common/message";
			}
}





