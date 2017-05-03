package com.one.yolo.qnaboard.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.one.yolo.common.SearchVO;
import com.one.yolo.qnaboard.controller.QnaBoardController;

@Service
public class QnaBoardServiceImpl implements QnaBoardService{
	private static final Logger logger =LoggerFactory.getLogger(QnaBoardServiceImpl.class);
	
	@Autowired
	private QnaBoardDAO qnaboardDao;
	
	@Override
	public List<Map<String, Object>> selectQnaBoard(SearchVO searchVO) {
		return qnaboardDao.selectQnaBoard(searchVO);
	}
	public int selectTotalRecord(SearchVO searchVo){
		return qnaboardDao.selectTotalRecord(searchVo);
	}
	@Override
	public int insertqna(QnaBoardVO qnaBoardVo) {
		return qnaboardDao.insertqna(qnaBoardVo);
	}
	@Override
	public List<QnaBoardVO> selectqna(int cNo) {
		return qnaboardDao.selectqna(cNo);
	}
	@Override
	@Transactional
	public int insertRepay(QnaRepayVO qnaRepayVo) {
		int cnt=0;
			cnt =qnaboardDao.insertRepay(qnaRepayVo);
		if(cnt>0){
			cnt =qnaboardDao.updateRepayCheck(qnaRepayVo.getCqNo());
		}
		return cnt;
	}
	@Override
	public List<QnaRepayVO> selectRepay() {
		return qnaboardDao.selectRepay();
	}
	@Override
	@Transactional
	public int updateqnaDelflag(int cqNo) {
		int cnt=0;
		cnt = qnaboardDao.countrepay(cqNo);
		if(cnt>0){
			cnt += qnaboardDao.updaterepayDelflag(cqNo);
			cnt += qnaboardDao.updateqnaDelflag(cqNo);
		}else{
			cnt += qnaboardDao.updateqnaDelflag(cqNo);
		}
		return cnt;
	}
	@Override
	@Transactional
	public int updaterepayDelflag(int cqNo) {
		int cnt=0;
		cnt = qnaboardDao.updaterepayDelflag(cqNo);
		if(cnt>0){
			cnt =qnaboardDao.updateRepayCheckN(cqNo);
		}
		return cnt;
	}
	
	
}
