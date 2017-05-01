package com.one.yolo.upfile.model;

public class UpfileVO {

	private int fNo;
	private String fFilename;
	private String fOriginalfilename;
	private long fFilesize;
	
	public UpfileVO(){
		//Default
	}
	
	public UpfileVO(String filename, String originalfilename, long filesize) {
		this.fFilename = filename;
		this.fOriginalfilename = originalfilename;
		this.fFilesize = filesize;
	}
	
	public int getfNo() {
		return fNo;
	}
	public void setfNo(int fNo) {
		this.fNo = fNo;
	}
	public String getfFilename() {
		return fFilename;
	}
	public void setfFilename(String fFilename) {
		this.fFilename = fFilename;
	}
	public String getfOriginalfilename() {
		return fOriginalfilename;
	}
	public void setfOriginalfilename(String fOriginalfilename) {
		this.fOriginalfilename = fOriginalfilename;
	}
	public long getfFilesize() {
		return fFilesize;
	}
	public void setfFilesize(long fFilesize) {
		this.fFilesize = fFilesize;
	}
	
	
	
}
