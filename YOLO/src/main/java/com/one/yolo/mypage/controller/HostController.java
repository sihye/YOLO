package com.one.yolo.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.util.JSONPObject;
import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.yolo.crecla.model.ClassService;
import com.one.yolo.crecla.model.ClassVO;

@Controller
@RequestMapping("/mypage/MyClass")
public class HostController {
	public static final Logger logger=LoggerFactory.getLogger(HostController.class);
	@Autowired
	public ClassService claService;
	@RequestMapping("/claSel.do")
	@ResponseBody
	public ClassVO claSel(HttpServletResponse resp, @RequestParam int cNo, Model model){
		
		logger.info("호스트 클래스 cno={}",cNo);
		ClassVO claVo=claService.selClass(cNo);
		logger.info("selcla={}",claVo);
		
		return claVo;
		/*JSONArray jArr=new JSONArray();
		JSONPObject jobj=new JSONPObject("claVo", claVo);
		jArr.add(claVo);
		resp.setContentType("text/xml;charset=utf-8");
		try {
			PrintWriter pw = resp.getWriter();
			pw.println(jobj.toString());
			pw.flush();
			pw.close();			
		} catch (IOException e) {
			e.printStackTrace();
		}*/
		
		

	}
}
