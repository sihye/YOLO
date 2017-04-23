package com.one.yolo.message.model;

import java.sql.Timestamp;

public class MessageVO {
	private int msNo;
	private String msUserid;
	private String msgUserid;
	private String msTitle;
	private String msContent;
	private Timestamp msRegdate;
	
	public int getMsNo() {
		return msNo;
	}
	public void setMsNo(int msNo) {
		this.msNo = msNo;
	}
	
	public String getMsUserid() {
		return msUserid;
	}
	public void setMsUserid(String msUserid) {
		this.msUserid = msUserid;
	}
	public String getMsgUserid() {
		return msgUserid;
	}
	public void setMsgUserid(String msgUserid) {
		this.msgUserid = msgUserid;
	}
	public String getMsTitle() {
		return msTitle;
	}
	public void setMsTitle(String msTitle) {
		this.msTitle = msTitle;
	}
	public String getMsContent() {
		return msContent;
	}
	public void setMsContent(String msContent) {
		this.msContent = msContent;
	}
	public Timestamp getMsRegdate() {
		return msRegdate;
	}
	public void setMsRegdate(Timestamp msRegdate) {
		this.msRegdate = msRegdate;
	}
	@Override
	public String toString() {
		return "MessageVO [msNo=" + msNo + ", msUserid=" + msUserid + ", msgUserid=" + msgUserid + ", msTitle="
				+ msTitle + ", msContent=" + msContent + ", msRegdate=" + msRegdate + "]";
	}
	
	
}
