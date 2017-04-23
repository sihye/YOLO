package com.one.yolo.message.model;

import java.util.List;

public class MessageListVO {
	private List<MessageVO> msItems;

	public List<MessageVO> getMsItems() {
		return msItems;
	}

	public void setMsItems(List<MessageVO> msItems) {
		this.msItems = msItems;
	}

	@Override
	public String toString() {
		return "MessageListVO [msItems=" + msItems + "]";
	}
	
	
}
