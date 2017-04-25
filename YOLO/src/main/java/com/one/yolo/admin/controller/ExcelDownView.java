package com.one.yolo.admin.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import com.one.yolo.upfile.model.UpfileService;

@Component
public class ExcelDownView extends AbstractView {
	 @Autowired
	 UpfileService uService;
	 public ExcelDownView() {
	      setContentType("application/octet-stream");
	   }
	   
	   @Override
	   protected void renderMergedOutputModel(Map<String, Object> map, 
	         HttpServletRequest request, HttpServletResponse response)
	         throws Exception {
	      //다운로드할 파일 객체 얻어오기
	      File file =  (File) map.get("downFile");
	      
	      
	      response.setContentType(getContentType());
	      
	      String fileName
	      =new String(file.getName().getBytes("euc-kr"), "8859_1");
	      response.setHeader("Content-disposition", "attachment;filename="+fileName);
	      
	      System.out.println(fileName);
	      if(file==null || !file.exists() || !file.canRead()){
	         //에러 처리
	         response.setContentType("text/html;charset=utf-8");
	         
	         PrintWriter out =  response.getWriter();
	         out.println("<script>");
	         out.println("alert('파일이 존재하지 않거나 읽을 수 없습니다');");
	         out.println("history.back();");
	         out.println("</script>");
	         
	         return;
	      }
	      
	      else{
	      OutputStream os = response.getOutputStream();
	      FileInputStream fis = new FileInputStream(file);
	      FileCopyUtils.copy(fis, os);
	      fis.close();
	      os.flush();
	     
	      }
	   }

}
