package com.one.yolo.upfile.model;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.one.yolo.member.model.MemberVO;

public interface UpfileService {
	
	public static final String UP_FILE ="File";
	public static final String UP_EXCEL = "Excel";
	
	public UpfileVO selectByOname(String fileName);
	public int insertUpfile(UpfileVO vo);
	public UpfileVO fileUpload(HttpServletRequest request,String uptype);
	public String getUploadPath(HttpServletRequest request,String uptype);
	public UpfileVO selectByFno(int no);
	public int deleteByFno(int no);
	public List<MemberVO> readExcel(File file);
}
