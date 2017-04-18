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
import org.springframework.web.bind.annotation.RequestParam;

import com.one.yolo.common.PaginationInfo;
import com.one.yolo.common.SearchVO;
import com.one.yolo.common.Utility;
import com.one.yolo.favoriteclass.model.FavoriteClassService;

@Controller
@RequestMapping("/mypage/Favorite")
public class FavoriteController {
	private static final Logger logger
	=LoggerFactory.getLogger(FavoriteController.class);
	@Autowired
	private FavoriteClassService favoriteClassSerive;

	@RequestMapping("/FavoriteClass.do")
	public String FavoriteClass(@ModelAttribute SearchVO searchVO
			, Model model,HttpServletRequest request){
		//세션에 저장
				HttpSession session = request.getSession();
				session.setAttribute("userid", "hong");
				String userid =(String)session.getAttribute("userid");
				searchVO.setUserid(userid);
				
		logger.info("FavoriteClass 화면 보여주기,파라미터 searchVO={}",searchVO);
		//[1] PaginationInfo 객체 생성 
		//=> firstRecordIndex 를 계산하기 위함
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVO.getCurrentPage());

		//[2] SearchVO 값 셋팅
		searchVO.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		searchVO.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		
		

		List<Map<String, Object>> alist = favoriteClassSerive.selectFavoriteClass(searchVO);
		logger.info("관심클래스 조회 결과 alist.size()={}",alist.size());

		int totalRecord =favoriteClassSerive.selectTotalRecord(searchVO);
		logger.info("관심클래스 조회-전체레코드 개수조회 결과, totalRecord={}",			
				totalRecord);

		pagingInfo.setTotalRecord(totalRecord);


		model.addAttribute("alist",alist);
		model.addAttribute("pagingInfo", pagingInfo);

		return "mypage/Favorite/FavoriteClass";
	}
	
	@RequestMapping("/FavoriteClassdeleteNo.do")
	public String FavoriteClassdeleteNo(@RequestParam(required=false,defaultValue="0") int SB_NO,Model model){
		logger.info("찜하기 삭제 처리, 파라미터 SB_NO={} ", SB_NO);
		int cnt=0;
		
		if(SB_NO!=0 ){
			cnt = favoriteClassSerive.deleteNoFavoriteClass(SB_NO);
		}

		logger.info("찜하기 삭제 cnt={}", cnt);
		String msg="",url="/mypage/Favorite/FavoriteClass.do";
		if(cnt==1){
			msg="삭제 성공";
		}else{
			msg="삭제 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	
	@RequestMapping("/FavoriteClassdeleteId.do")
	public String FavoriteClassdeleteId(HttpServletRequest request,Model model){
		HttpSession session = request.getSession();
		String userid =(String)session.getAttribute("userid"); 
		
		
		logger.info("클래스비우기  처리,파라미터 userid={}",userid);
		int cnt = favoriteClassSerive.deleteIdFavoriteClass(userid);
		logger.info("클래스비우기 cnt={}", cnt);
		String msg="",url="/mypage/Favorite/FavoriteClass.do";
		if(cnt!=0){
			msg="클래스비우기 성공";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
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
