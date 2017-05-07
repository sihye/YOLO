package com.one.yolo.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class AdminLoginInerceptor extends HandlerInterceptorAdapter{
	private static final Logger logger
	=LoggerFactory.getLogger(AdminLoginInerceptor.class);
	
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		logger.info("뷰 페이지 응답 후 호출-afterCompletion()");
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		logger.info("컨트롤러 수행후 호출-postHandle()");
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object arg2) throws Exception {
		logger.info("컨트롤러 수행전 호출-preHandle()");
		
		//관리자 로그인 페이지는 제외시키기
		String uri = request.getRequestURI();
		if(uri.indexOf("/admin/login/login.do")!=-1){
			return true;
		}
		
		String adminUserid 
		= (String) request.getSession().getAttribute("adminUserid");
		if(adminUserid==null || adminUserid.isEmpty()){
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('먼저 관리자 로그인하세요');");
			out.println("location.href='"+request.getContextPath()
				+"/admin/login/login.do';");			
			out.println("</script>");
			
			return false;
		}else{		
			return true;
		}
		
		
	}

	
}









