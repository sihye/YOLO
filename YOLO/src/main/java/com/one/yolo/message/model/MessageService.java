package com.one.yolo.message.model;

import java.util.List;
import java.util.Map;

import com.one.yolo.common.SearchVO;

public interface MessageService {
	public int insertSend(MessageVO messageVo,MessageMagaVO messageMagaVo);
	public List<Map<String, Object>> selectMessageSend(SearchVO searchVO);
	public int selectTotalRecordSend(SearchVO searchVo);
	public int selectTotalRecordGet(SearchVO searchVo);
	public int deleteMultiSend(List<MessageMagaVO> msmgList);
	public int deleteMultiGet(List<MessageVO> msList);
	public List<Map<String, Object>> selectMessageGet(SearchVO searchVO);
	public int messageCheck(int msNo);
}
