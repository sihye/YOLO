package com.one.yolo.message.model;

import java.util.List;
import java.util.Map;

import com.one.yolo.common.SearchVO;

public interface MessageDAO {
	public int insertMessage(MessageVO messageVo);
	public int insertMessageMaga(MessageMagaVO messageMagaVo);
	public List<Map<String, Object>> selectMessageSend(SearchVO searchVO);	
	public int selectTotalRecord(SearchVO searchVo);
	public int deleteMessageMaga(int messageMagaVo);
	public List<Map<String, Object>> selectMessageGet(SearchVO searchVO);
	public int deleteMessage(int messageVo);
}
