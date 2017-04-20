package com.one.yolo.mypage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.yolo.common.PaginationInfo;
import com.one.yolo.common.SearchVO;
import com.one.yolo.common.Utility;
import com.one.yolo.payment.model.PaymentService;

@Controller
@RequestMapping("/mypage/myedit")
public class MyEditController {
		
	private static final Logger logger
	=LoggerFactory.getLogger(MyEditController.class);
	
	@RequestMapping("/myedit.do")
	public String myEdit(){
		logger.info("myEdit 화면 보여주기");
		
		return "mypage/myedit/myedit";
	}
	
}






