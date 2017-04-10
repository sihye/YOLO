package com.one.yolo.upfile.model;

import javax.servlet.http.HttpServletRequest;

public interface UpfileService {
	public UpfileVO selectByOname(String fileName);
	public int insertUpfile(UpfileVO vo);
	public UpfileVO fileUpload(HttpServletRequest request);
}
