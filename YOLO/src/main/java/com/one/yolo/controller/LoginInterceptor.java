package com.one.yolo.controller;

import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class LoginInterceptor implements HandlerInterceptor{
	private static final Logger logger
	=LoggerFactory.getLogger(LoginInterceptor.class);
		
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		logger.info("afterCompletion() 호출됨!!");		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		logger.info("postHandle() 호출됨!!");		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object arg2) throws Exception {
		logger.info("preHandle() 호출됨!!");		

		//사용자의 요청이 컨트롤러에 전달되기 전에 호출됨
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("userid");
		if(userid==null || userid.isEmpty()){
			request.setAttribute("msg", "먼저 로그인하세요");
			request.setAttribute("url", "/index2.do?loginCheck=Y");
			
			RequestDispatcher dispatcher 
= request.getRequestDispatcher("/WEB-INF/views/common/message.jsp");
			dispatcher.forward(request, response);
			
			/*response.setContentType("text/html;charset=utf-8");			
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('먼저 로그인하세요!!');");
			out.println("location.href='"+
					request.getContextPath()
					+"/login/login.do';");			
			out.println("</script>");*/
			
			return false;  //다음 컨트롤러가 실행되지 않는다
		}
		
		return true;
		
	}

}










