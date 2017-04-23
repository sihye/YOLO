package com.one.yolo.message.model;

import java.util.List;

public class MessageMagaListVO {
	private List<MessageMagaVO> msmgItems;

	public List<MessageMagaVO> getMsmgItems() {
		return msmgItems;
	}

	public void setMsmgItems(List<MessageMagaVO> msmgItems) {
		this.msmgItems = msmgItems;
	}

	@Override
	public String toString() {
		return "MessageMageListVO [msmgItems=" + msmgItems + "]";
	}
	
	
}
