package com.one.yolo.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.one.yolo.admin.model.OperAtorService;
import com.one.yolo.admin.model.OperAtorVO;
import com.one.yolo.category.model.CategoryService;
import com.one.yolo.category.model.CategoryVO;
import com.one.yolo.upfile.model.UpfileService;
import com.one.yolo.upfile.model.UpfileVO;


@Controller
@RequestMapping(value="/admin")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private UpfileService upFileservice;
	
	@Autowired
	private OperAtorService operAtorservice;
	
	@Autowired
	private CategoryService categoryservice;
	
	@RequestMapping(value="/operator.do",method=RequestMethod.GET)
	public String upfile_get(Model model){
		logger.info("operator_get");
		List<CategoryVO> list = categoryservice.selectAll();
		
		model.addAttribute("list",list);
		
		return "admin/operator";
	}

	@RequestMapping(value="/operator.do",method=RequestMethod.POST)
	public String upfile_post(HttpServletRequest request ,@ModelAttribute OperAtorVO vo){
		logger.info("upfile =={}",vo);
		UpfileVO upfilevo = upFileservice.fileUpload(request);
		System.out.println("��Ʈ�ѷ������� vo="+upfilevo.getfNo());
		vo.setfNo(upfilevo.getfNo());
		System.out.println("�����Ŀ� �� = " + vo.getfNo());
		int cnt = operAtorservice.insertOperAtor(vo);
		
		if(cnt>0){
			logger.info("�ڷ� ���� ����!!!!!!!!!!!!!!!!!!!!!!!!!!");
		}else{
			logger.info("�ڷ� ���� ����!!!!!!!!!!!!!!!!!!!!!!!!!!");
		}
	
		return "admin/operator";
	}
	
	@RequestMapping(value="/opmain.do")
	public String main(){
		return "admin/opmain";
	}

	
	
}
