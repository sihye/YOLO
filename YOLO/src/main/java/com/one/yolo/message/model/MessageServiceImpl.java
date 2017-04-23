package com.one.yolo.message.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.one.yolo.common.SearchVO;

@Service
public class MessageServiceImpl implements MessageService{
	@Autowired
	private MessageDAO messageDao;

	@Override
	public int insertSend(MessageVO messageVo, MessageMagaVO messageMagaVo) {
		messageDao.insertMessage(messageVo);
		messageMagaVo.setMsNo(messageVo.getMsNo());
		messageMagaVo.setMsmgUserid(messageVo.getMsgUserid());
		return messageDao.insertMessageMaga(messageMagaVo);
	}
	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return messageDao.selectTotalRecord(searchVo);
	}

	@Override
	public List<Map<String, Object>> selectMessageSend(SearchVO searchVO) {
		return messageDao.selectMessageSend(searchVO);
	}
	@Override
	@Transactional
	public int deleteMultiSend(List<MessageMagaVO> msmgList) {
		int cnt=0;
		try{
			for(MessageMagaVO vo : msmgList){
				//선택한 상품만 삭제
				if(vo.getMsNo()>0){
					cnt = messageDao.deleteMessageMaga(vo.getMsNo());
				}
			}//for
		}catch(RuntimeException e){
			e.printStackTrace();
			cnt=-1;
		}		
		return cnt;
	}
	@Override
	public List<Map<String, Object>> selectMessageGet(SearchVO searchVO) {
		return messageDao.selectMessageGet(searchVO);
	}
	@Override
	@Transactional
	public int deleteMultiGet(List<MessageVO> msList) {
		int cnt=0;
		try{
			for(MessageVO vo : msList){
				//선택한 상품만 삭제
				if(vo.getMsNo()>0){
					cnt = messageDao.deleteMessage(vo.getMsNo());
				}
			}//for
		}catch(RuntimeException e){
			e.printStackTrace();
			cnt=-1;
		}		
		return cnt;
	}
}

