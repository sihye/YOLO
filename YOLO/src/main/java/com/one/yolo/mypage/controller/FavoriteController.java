package com.one.yolo.mypage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage/Favorite")
public class FavoriteController {
	private static final Logger logger
	=LoggerFactory.getLogger(FavoriteController.class);
	
	@RequestMapping("/FavoriteClass.do")
	public String FavoriteClass(){
		logger.info("FavoriteClass 화면 보여주기");
		
		return "mypage/Favorite/FavoriteClass";
	}
	@RequestMapping("/Favoritehost.do")
	public String Favoritehost(){
		logger.info("Favoritehost 화면 보여주기");
		
		return "mypage/Favorite/Favoritehost";
	}
	
	@RequestMapping("/seeClass.do")
	public String seeClass(){
		logger.info("seeClass 화면 보여주기");
		
		return "mypage/Favorite/seeClass";
	}

}
