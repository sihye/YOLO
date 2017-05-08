package com.one.yolo;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
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

import com.one.yolo.admin.model.OperAtorService;
import com.one.yolo.category.model.CategoryGroupVO;
import com.one.yolo.category.model.CategoryService;
import com.one.yolo.category.model.CategoryVO;
import com.one.yolo.common.PaginationInfo;
import com.one.yolo.common.SearchVO;
import com.one.yolo.common.Utility;
import com.one.yolo.crecla.model.ClassService;
import com.one.yolo.crecla.model.ClassVO;
import com.one.yolo.member.model.MemberService;
import com.one.yolo.member.model.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
	CategoryService cService;
	@Autowired
	OperAtorService oService;
	@Autowired
	ClassService claService;
	@Autowired
	MemberService memberService;
	
	
	@RequestMapping(value = "/hello.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	@RequestMapping("index2.do")
	public String index2(@ModelAttribute SearchVO searchVo,HttpSession session,HttpServletResponse response,Model modle){
		logger.info(" 화면 보여주기 ,파라미터 searchVO={}",searchVo);
		String userid = (String)session.getAttribute("userid");
		if(userid !=null && !userid.isEmpty()){
			if(userid.equals("admin")){
				logger.info("admin에서 넘어온 경우");
				session.removeAttribute("userid");
				Cookie ck = new Cookie("ck_userid", userid);
				ck.setPath("/");
				ck.setMaxAge(0); 
				response.addCookie(ck);
			}
		}
		//[1] PaginationInfo 객체 생성 
		//=> firstRecordIndex 를 계산하기 위함
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(6);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
	
		searchVo.setRecordCountPerPage(6);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<Map<String, Object>> classList= claService.selectClassBykNo(searchVo);
		logger.info("클래스  classList.size()={}",classList.size());
		int totalRecord = claService.selectClassCount(searchVo);
		logger.info("클래스 목록 조회-전체레코드 개수조회 결과, totalRecord={}",			
				totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		List<CategoryGroupVO> gList=cService.selCateGroupAll();
		List<CategoryVO> cList=cService.selectCateAll();
		List<Map<String, Object>>bannerList =oService.mainBannerList();
	
		
			modle.addAttribute("gList", gList);
			modle.addAttribute("cList", cList);
			modle.addAttribute("bList",bannerList);
			modle.addAttribute("classList",classList);
			modle.addAttribute("pagingInfo", pagingInfo);
			logger.info("glist size={}",gList.size());
			logger.info("clist size={}",cList.size());	
			logger.info("classList size={}",classList.size());
			logger.info("bList size={}",bannerList.size());
			
			return "index2";
		
	}
	
	@RequestMapping("about.do")
	public String about(){
		logger.info("소개 페이지");
		
		return "about";
	}
	
	@RequestMapping("contact.do")
	public String contact(){
		logger.info("컨텍트 페이지");
		
		return "contact";
	}
	
	@RequestMapping(value="/adminLogin.do", method=RequestMethod.GET)
	public String adminLogin_get(){
		logger.info("어드민 로그인 페이지 show");
		return "login/adminLogin";
	}
	@RequestMapping(value="/adminLogin.do", method=RequestMethod.POST)
	public String adminLogin_post(@RequestParam String userid, @RequestParam String pwd,@RequestParam(required=false)String chkSaveId ,HttpServletRequest request ,HttpSession session,HttpServletResponse response ,Model model){
		logger.info("로그인 시작 userid={},pwd{}",userid,pwd);
		MemberVO vo = memberService.adminLoginCheck(userid);
		
		String msg="",url="/adminLogin.do";
		
		if(vo != null){
			if(!vo.getmPwd().equals(pwd)){
				msg="비밀번호가 틀렸습니다.";
			}else{
				session.setAttribute("userid",userid);
				Cookie ck = new Cookie("ck_userid", userid);
				ck.setPath("/");
				if(chkSaveId!=null){
					ck.setMaxAge(1000*24*60*60); //1000일
					response.addCookie(ck);
				}else{
					ck.setMaxAge(0);
					response.addCookie(ck);
				}
				msg=userid+"님 환영 합니다!";
				url="/admin/operator.do";
			}
			
		}else{
			msg="존재하지 않는 아이디 입니다.";
			
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	
}
