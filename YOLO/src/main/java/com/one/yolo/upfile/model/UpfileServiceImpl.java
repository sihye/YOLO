package com.one.yolo.upfile.model;

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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;



@Service
public class UpfileServiceImpl implements UpfileService{
	
	private static final Logger logger = LoggerFactory.getLogger(UpfileServiceImpl.class);
	
	
	@Autowired
	private UpfileDAO dao;
	
	@Resource(name="fileUploadProperties")
	private Properties fileProperties;

	
	@Override
	public int insertUpfile(UpfileVO vo) {
		return dao.insertUpfile(vo);
	}

	@Override
	public UpfileVO selectByOname(String fileName) {
		return dao.selectByOname(fileName);
	}

	public UpfileVO fileUpload(HttpServletRequest request){
		
		
		System.out.println("파일 업로드 시작");
		MultipartHttpServletRequest multiRequest =(MultipartHttpServletRequest) request;
		
		Map<String,MultipartFile> fileMap=multiRequest.getFileMap();
		Iterator<String> iter= fileMap.keySet().iterator();
		UpfileVO vo = null;
		while(iter.hasNext()){
			String key = iter.next();
			MultipartFile tempFile = fileMap.get(key);
			//첨부파일 있을경우
			if(!tempFile.isEmpty()){
				String originalFileName = tempFile.getOriginalFilename();
				String fileName = getUniqueFileName(originalFileName);
				long fileSize = tempFile.getSize();				
				String savePath = getUploadPath(request,"File");
				File file = new File(savePath,fileName);
				
				System.out.println(originalFileName+" - "+fileName+"-"+fileSize);
				
				try {
					tempFile.transferTo(file);
					logger.info("저장장소 ={},파일이름={}",savePath,fileName);
					
					vo = new UpfileVO();
					vo.setfFilename(fileName);
					vo.setfOriginalfilename(originalFileName);
					vo.setfFilesize(fileSize);
					int cnt = insertUpfile(vo);
					if(cnt>0){
						System.out.println("cnt 0 보다 큼 진입");
						vo= new UpfileVO();
						System.out.println("오리지널 파일 네임 ="+originalFileName);
						vo=selectByOname(fileName);
						System.out.println("select 후에  no확인"+vo.getfNo());
					}
					
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}//while
		System.out.println("파일 업로드 끝");
		return vo;

	}
	
	public String getUploadPath(HttpServletRequest request,String uptype){
		String type = fileProperties.getProperty("file.upload.type");
		
		String upPath="";
		if(type.equals("test")){
			if(uptype.equals("File")){
				upPath=fileProperties.getProperty("file.upload.path.test");
			}else if(uptype.equals("Excel")){
				upPath=fileProperties.getProperty("excel.upload.path.test");
			}
		}else{
			String dir = fileProperties.getProperty("file.upload.path");
			upPath=
			 request.getSession().getServletContext().getRealPath(dir);
		}
		return upPath;
	}
	
	
	
	
	public String getUniqueFileName(String fName){
		int lastIndex = fName.lastIndexOf(".");
		fName =fName.substring(0,lastIndex)+"_"+getCurrentTime()+fName.substring(lastIndex);
		return fName;
	}
	
	public String getCurrentTime(){
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		return sdf.format(date);
	}

	@Override
	public UpfileVO selectByFno(int no) {
		return dao.selectByFno(no);
	}

	@Override
	public int deleteByFno(int no) {
		return dao.deleteByFno(no);
	}
	
	
	
	
}
