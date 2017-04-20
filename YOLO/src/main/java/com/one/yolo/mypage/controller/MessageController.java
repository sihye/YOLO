package com.one.yolo.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.yolo.message.model.MessageMagaVO;
import com.one.yolo.message.model.MessageService;
import com.one.yolo.message.model.MessageVO;


@Controller
@RequestMapping("/mypage/message")
public class MessageController {
	private static final Logger logger
	=LoggerFactory.getLogger(MessageController.class);
	@Autowired
	private MessageService messageService;
	
	@RequestMapping("/messageSend.do")
	public String messageSend(){
		logger.info("messageSend 화면 보여주기");
		
		return "mypage/message/messageSend";
	}
	@RequestMapping("/sendbox.do")
	public String sendbox(){
		logger.info("sendbox 화면 보여주기");
		
		return "mypage/message/sendbox";
	}
	@RequestMapping("/getbox.do")
	public String getbox(){
		logger.info("getbox 화면 보여주기");
		
		return "mypage/message/getbox";
	}
	@RequestMapping("/insertMessage.do")
	public String insertMessage(@ModelAttribute MessageVO messageVo,
			@ModelAttribute MessageMagaVO messageMagaVo,Model model,HttpServletRequest request){
		//세션에 저장
		HttpSession session = request.getSession();
		session.setAttribute("userid", "hong");
		String userid =(String)session.getAttribute("userid");
		messageVo.setmUserid(userid);
		
		logger.info("쪽지보내기 처리, 파라미터 messageVo={},messageMagaVo={}", messageVo,messageMagaVo);
		int cnt = messageService.insertSend(messageVo, messageMagaVo);
		logger.info("쪽지보내기 등록 cnt={}", cnt);
		
		String msg="",url="/mypage/message/messageSend.do";
		if(cnt!=0){
			msg="보내기 성공";
		}else{
			msg="보내기 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	@RequestMapping("/idSelect.do")
	public String idSelect(){
		logger.info("idSelect 화면 보여주기");
		
		return "mypage/message/idSelect";
	}
}
