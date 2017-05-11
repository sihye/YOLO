package com.one.yolo.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FileDownloadUtil {
	 /**
     * @brief   파일 다운로드
     * @details 파일 다운로드
     * @param   HttpServletRequest request, HttpServletResponse response, String filePath, String serverFileName, String downloadFileName
     * @return  boolean
     */
   public static boolean download(HttpServletRequest request, HttpServletResponse response, String filePath, String serverFileName, String downloadFileName) throws Exception {
      return download(request, response, filePath + serverFileName, downloadFileName);
   }
   
   /**
     * @brief   파일 다운로드
     * @details 파일 다운로드
     * @param   HttpServletRequest request, HttpServletResponse response, String serverFileFullPath, String downloadFileName
     * @return  boolean
     */
   public static boolean download(HttpServletRequest request, HttpServletResponse response, String serverFileFullPath, String downloadFileName) throws Exception{
      File downloadFile = new File(serverFileFullPath);
      
      // ../ ./ ..\ .\ % ; 문자 막기(파라미터 변조를 통해 다른 파일 접근 차단 
      Pattern p = Pattern.compile("(\\./)|(\\.\\./)|(\\.\\\\)|(\\.\\.\\\\)|(%)|(;)");
      
      Matcher m = p.matcher(serverFileFullPath);
      if (m.find()){
          return false;
      }
      
      m = p.matcher(downloadFileName);
      if (m.find()){
          return false;
      }
      
      if (downloadFile.exists() && downloadFile.isFile()) {
         response.setContentType("application/octet-stream; charset=UTF-8");
         response.setContentLength((int) downloadFile.length());
         OutputStream outputstream = null;
         FileInputStream inputstream = null;
         try {
            response.setHeader("Content-Disposition", getDisposition(downloadFileName, check_browser(request)));
            response.setHeader("Content-Transfer-Encoding", "binary");
            outputstream = response.getOutputStream();
            inputstream = new FileInputStream(downloadFile);
            byte[] buffer = new byte[1024];
            int length = 0;
            while ((length = inputstream.read(buffer)) > 0) {
               outputstream.write(buffer, 0, length);
            }
         } catch (Exception e) {
            e.printStackTrace();
         } finally {
            try {
               if (inputstream != null) {
                  inputstream.close();
               }
               outputstream.close();
            } catch (Exception e2) {
            }
         }
      } else {
         PrintWriter out = response.getWriter();
            out.println("<html>");
            out.println("<script type='text/javascript'>");
            out.println("window.location.href = '/settle/error/404'");
            out.println("</script>");
            out.println("<body>");
            out.println("</body>");
            out.println("</html>"); 
         return false;
      }
      return true;
   }
   
   /**
     * @brief   브라우저 확인
     * @details 브라우저 확인
     * @param   HttpServletRequest request
     * @return  String
     */
   private static String check_browser(HttpServletRequest request) {
      String browser = "";
      String header = request.getHeader("User-Agent");
      // 신규추가된 indexof : Trident(IE11) 일반 MSIE로는 체크 안됨
      if (header.indexOf("MSIE") > -1 || header.indexOf("Trident") > -1) {
         browser = "ie";
      }
      // 크롬일 경우
      else if (header.indexOf("Chrome") > -1) {
         browser = "chrome";
      }
      // 오페라일경우
      else if (header.indexOf("Opera") > -1) {
         browser = "opera";
      }
      // 사파리일 경우
      else if (header.indexOf("Apple") > -1) {
         browser = "sarari";
      } else {
         browser = "firfox";
      }
      return browser;
   }

   /**
     * @brief   Disposition 가공
     * @details 브라우저에 따라 Disposition 가공하여 리턴
     * @param   String down_filename, String browser_check
     * @return  String
     */
   private static String getDisposition(String down_filename, String browser_check) throws UnsupportedEncodingException {
      String prefix = "attachment;filename=";
      String encodedfilename = null;
      System.out.println("browser_check:" + browser_check);
      if (browser_check.equals("ie")) {
         encodedfilename = URLEncoder.encode(down_filename, "UTF-8").replaceAll("\\+", "%20");
      } else if (browser_check.equals("chrome")) {
         StringBuffer sb = new StringBuffer();
         for (int i = 0; i < down_filename.length(); i++) {
            char c = down_filename.charAt(i);
            if (c > '~') {
               sb.append(URLEncoder.encode("" + c, "UTF-8"));
            } else {
               sb.append(c);
            }
         }
         encodedfilename = sb.toString();
      } else {
         encodedfilename = "\"" + new String(down_filename.getBytes("UTF-8"), "8859_1") + "\"";
      }
      return prefix + encodedfilename;
   }
	
}
