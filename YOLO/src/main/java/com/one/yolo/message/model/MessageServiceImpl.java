package com.one.yolo.message.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageServiceImpl implements MessageService{
	@Autowired
	private MessageDAO messageDao;

	@Override
	public int insertSend(MessageVO messageVo, MessageMagaVO messageMagaVo) {
		messageDao.insertMessage(messageVo);
		messageMagaVo.setMsNo(messageVo.getMsNo());
		return messageDao.insertMessageMaga(messageMagaVo);
	}
	
}
