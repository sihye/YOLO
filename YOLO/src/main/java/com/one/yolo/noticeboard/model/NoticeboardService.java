package com.one.yolo.noticeboard.model;

import java.util.List;

import com.one.yolo.common.SearchVO;

public interface NoticeboardService {
	public List<NoticeboardVO> selectNoticeboard();
/*	public List<NoticeboardVO> selectNoticeboard(SearchVO searchVo);
	public int selectTotalRecord(SearchVO searchVo);*/
	public int insertNoticboard(NoticeboardVO vo);
	public NoticeboardVO selectNo(int no);
	public int updateReadCount(int no);
	public int updateNotice(NoticeboardVO vo);
	
}
