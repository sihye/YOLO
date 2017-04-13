package com.one.yolo.admin.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
		List<Map<String,Object>> map = operAtorservice.selectJoin();
		model.addAttribute("list",list);
		model.addAttribute("map",map);
		return "admin/operator";
	}

	@RequestMapping(value="/operator.do",method=RequestMethod.POST)
	public String upfile_post(HttpServletRequest request ,@ModelAttribute OperAtorVO vo,Model model){
		logger.info("upfile =={}",vo);
		UpfileVO upfilevo = upFileservice.fileUpload(request);
		vo.setfNo(upfilevo.getfNo());
		int cnt = operAtorservice.insertOperAtor(vo);
		String msg="",url="/admin/operator.do";
		if(cnt>0){
			msg="등록성공 !";
		}else{
			msg="등록실패 !";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
	
		return "common/message";
	}
	
	@RequestMapping(value="/opmain.do", method=RequestMethod.GET)
	
		public String main_get(Model model){
			logger.info("operator_get");
			List<Map<String,Object>> map = operAtorservice.selectJoin();
			
			model.addAttribute("map",map);
			
			return "admin/operator";
		
	}
	
	@RequestMapping("/delBn.do")
	public String dleupdate(@RequestParam int no, HttpServletRequest request, Model model){
		logger.info("삭제 처리를 위한 update작업 int no = {}",no);
		OperAtorVO opvo = operAtorservice.selectByNo(no);
		logger.info("operator select 결과 fno ={}",opvo.getfNo());
		int fileNo = opvo.getfNo();
		UpfileVO fvo = upFileservice.selectByFno(fileNo);
		String oldFileName=fvo.getfFilename();
		logger.info("old파일 네임 = {}",oldFileName);
		
		//=> [2] 기존 파일이 있다면 삭제
		if(oldFileName!=null && !oldFileName.isEmpty()){
			String upPath = upFileservice.getUploadPath(request);
			File oldFile = new File(upPath, oldFileName);
			if(oldFile.exists()){
				boolean bool =oldFile.delete();
				logger.info("기존 파일 삭제 여부:{}", bool);
			}
		}
		int result = operAtorservice.delupdate(no);
		String msg = "",url="/admin/opmain.do";
		if(result >0){
			msg = "삭제 완료했습니다.";
		}else{
			msg="삭제 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
		
	}
	@RequestMapping("/insertBn.do")
	public String insertBn(Model model ){
		List<CategoryVO> list = categoryservice.selectAll();
		model.addAttribute("list",list);
		return "admin/operatorInsert";
	}

	
	
}
