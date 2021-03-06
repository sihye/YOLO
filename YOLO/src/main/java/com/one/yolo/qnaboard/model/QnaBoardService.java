package com.one.yolo.qnaboard.model;

import java.util.List;
import java.util.Map;

import com.one.yolo.common.SearchVO;

public interface QnaBoardService {
	public List<Map<String, Object>> selectQnaBoard(SearchVO searchVO);
	public int selectTotalRecord(SearchVO searchVo);
	public int insertqna(QnaBoardVO qnaBoardVo);
	public List<QnaBoardVO> selectqna(int cNo);
	public int insertRepay(QnaRepayVO qnaRepayVo);
	public List<QnaRepayVO> selectRepay();
	public int updateqnaDelflag(int cqNo);
	public int updaterepayDelflag(int cqNo);
}
