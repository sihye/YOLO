package com.one.yolo.crecla.controller;

import java.util.List;
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

import com.one.yolo.category.model.CategoryGroupVO;
import com.one.yolo.category.model.CategoryService;
import com.one.yolo.category.model.CategoryVO;
import com.one.yolo.common.FileUploadWebUtil;
import com.one.yolo.crecla.model.ClassService;
import com.one.yolo.crecla.model.ClassVO;
import com.one.yolo.upfile.model.UpfileService;
import com.one.yolo.upfile.model.UpfileVO;

@Controller
@RequestMapping("/class")
public class ClaController {
	private static final Logger logger =LoggerFactory.getLogger(ClaController.class);
	
	@Autowired
	private CategoryService cService;
	@Autowired
	private ClassService claService;
	@Autowired
	private UpfileService uService;
	@Autowired
	private FileUploadWebUtil fileUploadWebUtil;


	
	//클래스 생성 페이지 보여주기
	@RequestMapping(value="/clacre.do", method=RequestMethod.GET)
	public String showClaCre_get(@RequestParam(defaultValue="0", required=false)int kgNo,Model model){
		logger.info("클래스생성페이지 보여주기");
		List<CategoryGroupVO> gCateList=cService.selCateGroupAll();
		List<CategoryVO> cateList =cService.selectCateAll();
		logger.info("☆☆☆gcateList size={}",gCateList.size());
		logger.info("cateList size={}",cateList.size());
		model.addAttribute("gCateList", gCateList);
		model.addAttribute("cateList", cateList);
		return "class/creclass";
	}
	
	//클래스 인서트
	@RequestMapping(value="/clacre.do", method=RequestMethod.POST)
	public String insertCla(HttpServletRequest req, @ModelAttribute ClassVO vo, Model model){
		logger.info("클래스 insert param vo={}",vo);
		vo.setmUserid("hong");
		
		//파일 업로드 처리
		List<Map<String, Object>> fileList= fileUploadWebUtil.fileUpload(req, FileUploadWebUtil.IMAGE_UPLOAD);
		logger.info("업로드 이미지 filelist size={}",fileList.size());
		
		//업로드 완료된 경우
		String imgUrl[]=new String [fileList.size()];
		if(fileList!=null&&!fileList.isEmpty()){
			for(int i=0;i<fileList.size();i++){
				Map<String, Object> map=fileList.get(i);
				imgUrl[i]=(String)map.get("fileName");
				logger.info("저장 img name={}",(String)map.get("fileName"));
			}
			//img url vo setting
			if(fileList.size()==1){
				vo.setcMainimg(imgUrl[0]);
				vo.setcDetailimg1("");
				vo.setcDetailimg2("");
				vo.setcDetailimg3("");
			}else if(fileList.size()==2){
				vo.setcMainimg(imgUrl[0]);
				vo.setcDetailimg1(imgUrl[1]);
				vo.setcDetailimg2("");
				vo.setcDetailimg3("");
			}else if(fileList.size()==3){
				vo.setcMainimg(imgUrl[0]);
				vo.setcDetailimg1(imgUrl[1]);
				vo.setcDetailimg2(imgUrl[2]);
				vo.setcDetailimg3("");
			}else{
				vo.setcMainimg(imgUrl[0]);
				vo.setcDetailimg1(imgUrl[1]);
				vo.setcDetailimg2(imgUrl[2]);
				vo.setcDetailimg3(imgUrl[3]);
			}
		}		
		logger.info("cla inset param vo(셋팅완료)={}",vo);
		
		int cnt=claService.claInsert(vo);
		String msg="",url="/class/clacre.do";
		if(cnt>0){
			
				msg="클래스 등록 성공!";
				url="/index.do";
						
		}else{
			msg="클래스 등록 실패! 다시 시도해 주세요 ^^";		
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
	


	@RequestMapping("/claDetail.do")
	public String claDetail(@RequestParam int cNo,HttpSession session, Model model, HttpServletResponse response){
		String userid=(String)session.getAttribute("userid");
		logger.info("클래스 디테일 파람no={}, session userid={}",cNo,userid);
		int cnt=claService.hitUpdate(cNo);
		logger.info("hit update cnt={}",cnt);
		String claNo = Integer.toString(cNo);
		Cookie cookie =new Cookie("classNo"+claNo,claNo);
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		
		ClassVO vo=claService.selClass(cNo);	
		String kName=cService.selCateNameByNo(vo.getkNo());
		
		userid="hong";
		List<ClassVO> alist=claService.selInterCla(userid);
		model.addAttribute("inClaList",	alist);
		logger.info("관심클래스 list size={}",alist.size());
		
		model.addAttribute("claVo", vo);
		model.addAttribute("kName", kName);
		return "class/classDetail";
	}
	

	@RequestMapping("classCre.do")
	public void test(){
		logger.info("test확인");

	}
	
	@RequestMapping(value="/searchClass.do", method=RequestMethod.POST)
	public String searchClass(@RequestParam String search, Model model){
		logger.info("클래스 검색 페이지 검색어={}",search);
		
		List<CategoryGroupVO> gCateList=cService.selCateGroupAll();
		List<CategoryVO> cateList =cService.selectCateAll();
		logger.info("☆☆☆gcateList size={}",gCateList.size());
		
		model.addAttribute("gCateList", gCateList);
		model.addAttribute("cateList", cateList);
		model.addAttribute("search", search);
		
		return "class/searchClass";
	}
	
}
