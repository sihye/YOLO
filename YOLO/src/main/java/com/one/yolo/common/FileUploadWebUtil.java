package com.one.yolo.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
public class FileUploadWebUtil {
	//파일업로드 관련 상수
	public static final int FILE_UPLOAD=1;  //관리자-엑셀파일 업로드
	public static final int IMAGE_UPLOAD=2; //상품등록-이미지 업로드
	
	private static final Logger logger
	=LoggerFactory.getLogger(FileUploadWebUtil.class);
	
	@Resource(name="fileUploadProperties")
	private Properties fileProperties;
	
	
	public  List<Map<String, Object>> fileUpload(
			HttpServletRequest request, int uploadGb){
		//파일 업로드 처리
		
		//업로드 처리를 위해 MultipartHttpServletRequest로 다운 캐스팅
		MultipartHttpServletRequest multiRequest
		=(MultipartHttpServletRequest) request;
		
		Map<String, MultipartFile> fileMap =multiRequest.getFileMap();
		
		//업로드한 파일들의 정보를 담을 List
		List<Map<String, Object>> fileList
		=new ArrayList<Map<String,Object>>();
		
 		Iterator<String> iter = fileMap.keySet().iterator();

 		while(iter.hasNext()){
 			String key = iter.next();
  			MultipartFile tempFile = fileMap.get(key);
  			
  			//파일이 업로드된 경우
  			if(!tempFile.isEmpty()){
  				String originFileName = tempFile.getOriginalFilename();
  				//이름이 중복되는 경우 파일명 변경하기
  				String fileName = getUniqueFileName(originFileName);
  				
  				long fileSize=tempFile.getSize();
  				
  				//파일 업로드 처리
  				//업로드할 경로 구하기  				
  				String savePath= getUploadPath(request, uploadGb); 
  				File file = new File(savePath, fileName);
  				try {
					tempFile.transferTo(file);
					logger.info("파일 업로드 완료! 업로드 경로:{},파일명:{}",
							savePath, fileName);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
  				  				
  				//파일명과 파일크기를 먼저 map에 저장
  				Map<String, Object> map 
  					= new HashMap<String, Object>();
  				map.put("fileName", fileName);
  				map.put("fileSize", fileSize);
  				map.put("originalFileName", originFileName);
  				
  				//다시 map을 List에 저장
  				fileList.add(map);
  			}
 		}//while
 		
 		return fileList;
	}
	
	public String getUploadPath(HttpServletRequest request, 
			int uploadGb){
		//파일 업로드 경로 구하기
		String type=fileProperties.getProperty("file.upload.type");
		logger.info("파일업로드 type={}",type);
		
		String upPath="", dir="";
		if(type.equals("test")){
			//테스트 경로
			if(uploadGb==IMAGE_UPLOAD){
				logger.info("test-imgupload 들어옴");
				upPath=fileProperties.getProperty("file.upload.path.test");
				logger.info("up path={}",upPath);
			}else if(uploadGb==FILE_UPLOAD){
				upPath=fileProperties.getProperty("imageFile.upload.path.test");
			}
		}else{
			//배포시 실제 경로
			if(uploadGb==FILE_UPLOAD){
				dir = fileProperties.getProperty("file.upload.path");
				//=> pds_upload
			}else if(uploadGb==IMAGE_UPLOAD){
				dir=fileProperties.getProperty("imageFile.upload.path");
			}
			
			/*
			 [1] application.getRealPath(dir); 
			 [2] config.getServletContext().getRealPath(dir); 
			    또는
	       request.getSession().getServletContext().getRealPath(dir); 			  
			 */
			upPath
			=request.getSession().getServletContext().getRealPath(dir);			
		}
		
		return upPath;		
	}
	
	public String getUniqueFileName(String fName){
		//파일명이 중복되지 않도록 파일명 이름 변경
		//ab.txt => ab_20170404152650123.txt
		//=> 순수 파일명과 확장자사이에 현재시간(밀리초) 추가
		int idx = fName.lastIndexOf(".");
 		String fileNm = fName.substring(0, idx);  //ab
 		String ext = fName.substring(idx);  //.txt
 		
 		return fileNm+"_"+getCurrentTime()+ext;
	}
	
	public String getCurrentTime(){
		Date today = new Date();
		SimpleDateFormat sdf 
			= new SimpleDateFormat("yyyyMMddHHmmssSSS");
		
		return sdf.format(today);
	}

}
