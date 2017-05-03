package com.one.yolo.qnaboard.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.yolo.qnaboard.model.QnaBoardService;
import com.one.yolo.qnaboard.model.QnaBoardVO;
import com.one.yolo.qnaboard.model.QnaRepayVO;

@Controller
@RequestMapping("/class")
public class QnaBoardController {

	private static final Logger logger =LoggerFactory.getLogger(QnaBoardController.class);
	
	@Autowired
	private QnaBoardService qnaboardService;
	
	//클래스 qna 페이지 보여주기
	@RequestMapping("/classqna.do")
	public String classqna(@RequestParam int cNo,Model model){
		logger.info("클래스qna페이지 보여주기,파라미터 cNo={}",cNo);
		
		List<QnaBoardVO> alist =qnaboardService.selectqna(cNo);
		List<QnaRepayVO> repayList = qnaboardService.selectRepay();
		
		model.addAttribute("qnaList",alist);
		model.addAttribute("repayList",repayList);
		return "class/classqna";
	}
	@RequestMapping("/insertqna.do")
	public String insertqna(@ModelAttribute QnaBoardVO qnaBoardVo,HttpSession session,Model model){
		String userid = (String)session.getAttribute("userid");
		qnaBoardVo.setmUserid(userid);
		if(qnaBoardVo.getCqSecretcheck()==null||qnaBoardVo.getCqSecretcheck().isEmpty()){
			qnaBoardVo.setCqSecretcheck("N");
		}
		logger.info("qna게시판-insert,파라미터 qnaBoardVo={}",qnaBoardVo);
		
		int cnt = qnaboardService.insertqna(qnaBoardVo);
		String msg="",url="/class/claDetail.do?cNo="+qnaBoardVo.getcNo();
		if(cnt>0){
			msg="qna 등록 성공";
		}else{
			msg="qna 등록 실패";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	
	@RequestMapping("/insertrepay.do")
	public String insertrepay(@ModelAttribute QnaRepayVO qnaRepayVo,@RequestParam int cNo,HttpSession session,Model model){
		String userid = (String)session.getAttribute("userid");
		qnaRepayVo.setmUserid(userid);
		logger.info("qna답변-insert,파라미터 qnaRepayVo={},cNo={}",qnaRepayVo,cNo);
		int cnt =qnaboardService.insertRepay(qnaRepayVo);
		String msg="",url="/class/claDetail.do?cNo="+cNo;
		if(cnt>0){
			msg="qna 답변등록 성공";
		}else{
			msg="qna 답변등록 실패";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	@RequestMapping("/updateqnaDelflag.do")
	public String updateqnaDelflag(@RequestParam int cqNo,@RequestParam int cNo,Model model){
		logger.info("qna게시판-delete,파라미터 cqNo={},cNo={}",cqNo,cNo);
		
		int cnt = qnaboardService.updateqnaDelflag(cqNo);
		
		String msg="",url="/class/claDetail.do?cNo="+cNo;
		if(cnt>0){
			msg="qna 삭제 성공";
		}else{
			msg="qna 삭제 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	@RequestMapping("/updaterepayDelflag.do")
	public String updaterepayDelflag(@RequestParam int cqNo,@RequestParam int cNo,Model model){
		logger.info("qna답변-delete,파라미터 cqNo={},cNo={}",cqNo,cNo);
		
		int cnt = qnaboardService.updaterepayDelflag(cqNo);
		
		String msg="",url="/class/claDetail.do?cNo="+cNo;
		if(cnt>0){
			msg="qna답변 삭제 성공";
		}else{
			msg="qna답변 삭제 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
}
