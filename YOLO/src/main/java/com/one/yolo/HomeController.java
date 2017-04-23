package com.one.yolo;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.one.yolo.category.model.CategoryGroupVO;
import com.one.yolo.category.model.CategoryService;
import com.one.yolo.category.model.CategoryVO;

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
	public void index2(Model modle){
		logger.info("메인 페이지 보여주기");
		List<CategoryGroupVO> gList=cService.selCateGroupAll();
		List<CategoryVO> cList=cService.selectCateAll();
		
		modle.addAttribute("gList", gList);
		modle.addAttribute("cList", cList);
		logger.info("glist size={}",gList.size());
		logger.info("clist size={}",cList.size());
	}
	

	
}
