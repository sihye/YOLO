package com.one.yolo.mypage.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.yolo.common.PaginationInfo;
import com.one.yolo.common.SearchVO;
import com.one.yolo.common.Utility;

@Controller
@RequestMapping("/mypage/MyClass")
public class MyClassController {
		
	private static final Logger logger
	=LoggerFactory.getLogger(MyClassController.class);
	
	@RequestMapping("/HostClass.do")
	public String qnaboard(){
		logger.info("HostClass 화면 보여주기");
		
		return "mypage/MyClass/HostClass";
	}
	@RequestMapping("/PartClass.do")
	public String PartClass(){
		logger.info("PartClass 화면 보여주기");
		
		return "mypage/MyClass/PartClass";
	}
	/*@RequestMapping("/Payment.do")
	public String Payment(@ModelAttribute SearchVO searchVO, Model model){
		logger.info("qnaboard 화면 보여주기 ,파라미터 searchVO={}",searchVO);
		//[1] PaginationInfo 객체 생성 
		//=> firstRecordIndex 를 계산하기 위함
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVO.getCurrentPage());

		//[2] SearchVO 값 셋팅
		searchVO.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		searchVO.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		List<Map<String, Object>> alist = qnaboardService.selectQnaBoard(searchVO);
		logger.info("문의게시판 조회 결과 alist.size()={}",alist.size());

		int totalRecord =qnaboardService.selectTotalRecord(searchVO);
		logger.info("글목록 조회-전체레코드 개수조회 결과, totalRecord={}",			
				totalRecord);

		pagingInfo.setTotalRecord(totalRecord);

		model.addAttribute("alist",alist);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "mypage/MyClass/Payment";
	}*/
}






