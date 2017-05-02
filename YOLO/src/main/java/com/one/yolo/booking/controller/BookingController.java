package com.one.yolo.booking.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.one.yolo.booking.model.BookingVO;
import com.one.yolo.crecla.model.ClassService;
import com.one.yolo.crecla.model.ClassVO;
import com.one.yolo.member.model.MemberService;
import com.one.yolo.member.model.MemberVO;

@Controller
@RequestMapping("/class")
public class BookingController {
	private static final Logger logger=LoggerFactory.getLogger(BookingController.class);
	@Autowired
	private MemberService memService;
	@Autowired
	private ClassService claService;
	
	@RequestMapping("/booking.do")
	public String booking(HttpSession session,@RequestParam int cNo,@ModelAttribute BookingVO bookVO, Model model){
		String userid=(String)session.getAttribute("userid");
		logger.info("userid={}, booking vo={}",userid,bookVO);
		//회원정보
		MemberVO memVo=memService.selectByUserid(userid);
		model.addAttribute("memVo", memVo);
		logger.info("sel mem vo={}",memVo);
		//클래스정보
		ClassVO claVo=claService.selClass(cNo);
		model.addAttribute("claVo", claVo);
		logger.info("sel cla vo={}", claVo);
		//예약정보
		model.addAttribute("bookVo", bookVO);
		
		return "class/booking";
	}
}
