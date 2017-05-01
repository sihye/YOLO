package com.one.yolo.mypage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.yolo.common.PaginationInfo;
import com.one.yolo.common.SearchVO;
import com.one.yolo.common.Utility;
import com.one.yolo.follow.model.FollowVO;
import com.one.yolo.payment.model.PaymentCancelVO;
import com.one.yolo.payment.model.PaymentService;
import com.one.yolo.payment.model.PaymentVO;

@Controller
@RequestMapping("/mypage/MyClass")
public class MyClassController {

	private static final Logger logger
	=LoggerFactory.getLogger(MyClassController.class);
	@Autowired
	private PaymentService paymentService;

	@RequestMapping("/HostClass.do")
	public String qnaboard(){
		logger.info("HostClass 화면 보여주기");

		return "mypage/MyClass/HostClass";
	}
	@RequestMapping("/PartClass.do")
	public String PartClass(@ModelAttribute SearchVO searchVO,HttpSession session, Model model){
		//세션에 저장

		String userid =(String)session.getAttribute("userid");
		searchVO.setUserid(userid);
		searchVO.setPmCancelcheck("N");
		logger.info("PartClass 화면 보여주기 ,파라미터 searchVO={}",searchVO);
		//[1] PaginationInfo 객체 생성 
		//=> firstRecordIndex 를 계산하기 위함
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		pagingInfo.setCurrentPage(searchVO.getCurrentPage());

		//[2] SearchVO 값 셋팅
		searchVO.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
		searchVO.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		List<Map<String, Object>> alist = paymentService.selectPayment(searchVO);
		logger.info("결제내역 조회 결과 alist.size()={}",alist.size());

		int totalRecord =paymentService.selectTotalRecord(searchVO);
		logger.info("결제내역 조회-전체레코드 개수조회 결과, totalRecord={}",			
				totalRecord);

		pagingInfo.setTotalRecord(totalRecord);

		model.addAttribute("alist",alist);
		model.addAttribute("pagingInfo", pagingInfo);

	return "mypage/MyClass/PartClass";
}

@RequestMapping("/Payment.do")
public String payment(@ModelAttribute SearchVO searchVO,HttpSession session, Model model){
	//세션에 저장

	String userid =(String)session.getAttribute("userid");
	searchVO.setUserid(userid);
	logger.info("Payment 화면 보여주기 ,파라미터 searchVO={}",searchVO);
	//[1] PaginationInfo 객체 생성 
	//=> firstRecordIndex 를 계산하기 위함
	PaginationInfo pagingInfo = new PaginationInfo();
	pagingInfo.setBlockSize(Utility.BLOCKSIZE);
	pagingInfo.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
	pagingInfo.setCurrentPage(searchVO.getCurrentPage());

	//[2] SearchVO 값 셋팅
	searchVO.setRecordCountPerPage(Utility.RECORDCOUNT_PERPAGE);
	searchVO.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

	List<Map<String, Object>> alist = paymentService.selectPayment(searchVO);
	logger.info("결제내역 조회 결과 alist.size()={}",alist.size());
	List<PaymentCancelVO> pcList = paymentService.selectPaymentCancel();
	logger.info("결제취소 내역 조회 결과 pcList.size()={}",pcList.size());
	int totalRecord =paymentService.selectTotalRecord(searchVO);
	logger.info("결제내역 조회-전체레코드 개수조회 결과, totalRecord={}",			
			totalRecord);

	pagingInfo.setTotalRecord(totalRecord);

	model.addAttribute("alist",alist);
	model.addAttribute("pcList",pcList);
	model.addAttribute("pagingInfo", pagingInfo);

	return "mypage/MyClass/Payment";
}

@RequestMapping("/paymentcancel.do")
public String paymentcancel(){
	logger.info("paymentcancel 화면 보여주기");


	return "mypage/MyClass/paymentcancel";
}

@RequestMapping("/insertPaymentCancel.do")
@Transactional
public String insertPaymentCancel(@ModelAttribute PaymentCancelVO vo,Model model){
	if(vo.getPmcDetatl()==null||vo.getPmcDetatl().isEmpty()){
		vo.setPmcDetatl(vo.getPmcCalcel());
	}
	logger.info("insertPaymentCancel 화면 보여주기,파라미터 vo={}",vo);
	int cnt =0;
	//이미 취소신청한 내역 확인
	cnt =paymentService.cancelCount(vo.getPmNo());
	logger.info("이미 취소신청한 내역 확인 cnt={}",cnt);
	String msg="",url="/mypage/MyClass/Payment.do";
	PaymentVO pVo=new PaymentVO();
	if(cnt>0){
		msg="이미 취소신청한 결제내역입니다";		
	}else{
		cnt = paymentService.insertPaymentCancel(vo);
		logger.info("결제 취소 신청-cnt={}",cnt);
		if(cnt>0){
			msg="결제취소 신청 완료";
			pVo.setPmCancelcheck("Y");
			pVo.setPmNo(vo.getPmNo());
			cnt = paymentService.cancelcheckYN(pVo);
			logger.info("결제취소 신청 완료 후 cnt={},pVo={}",cnt,pVo);
		}else{
			msg="결제취소 신청 실패";
		}
	}


	model.addAttribute("msg",msg);
	model.addAttribute("url",url);
	return "common/message";
}
}






