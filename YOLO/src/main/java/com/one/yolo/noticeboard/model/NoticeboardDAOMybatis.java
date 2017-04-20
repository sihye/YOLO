package com.one.yolo.noticeboard.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.one.yolo.common.SearchVO;

@Repository
public class NoticeboardDAOMybatis extends SqlSessionDaoSupport 
	implements NoticeboardDAO{
	
	private String namespace="config.mybatis.mapper.oracle.noticeboard";
	
	
/*	@Override
	public List<NoticeboardVO> selectNoticeboard() {
		return getSqlSession().selectList(namespace+".selectNotice");
	}
*/
	@Override
	public List<NoticeboardVO> selectNoticeboard(SearchVO searchVo){
		return getSqlSession().selectList(namespace+".selectNotice", searchVo);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return getSqlSession().selectOne(namespace+".selectTotalRecord", searchVo);
	}
	
	@Override
	public int insertNoticboard(NoticeboardVO vo){
		return getSqlSession().insert(namespace+".insertNotice", vo);
	}
	
	@Override
	public NoticeboardVO selectNo(int no){
		return getSqlSession().selectOne(namespace+".selectNo", no);
	}
	
	@Override
	public int updateReadCount(int no){
		return getSqlSession().update(namespace+".updateReadCount", no);
	}

	@Override
	public int updateNotice(NoticeboardVO vo) {
		return getSqlSession().update(namespace+".updateNotice", vo);
	}



	


	
}
