package com.one.yolo.upfile.model;

public interface UpfileDAO {
	public UpfileVO selectByOname(String fileName);
	public int insertUpfile(UpfileVO vo);
	public UpfileVO selectByFno(int no);
}
