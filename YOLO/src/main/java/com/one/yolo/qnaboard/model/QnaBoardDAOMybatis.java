package com.one.yolo.qnaboard.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.one.yolo.common.SearchVO;

@Repository
public class QnaBoardDAOMybatis extends SqlSessionDaoSupport implements QnaBoardDAO {
	
	private String namespace="config.mybatis.mapper.oracle.qnaboard";
	
	@Override
	public List<Map<String, Object>> selectQnaBoard(SearchVO searchVO) {
		return getSqlSession().selectList(namespace+".selectQnaBoard",searchVO);
	}
	public int selectTotalRecord(SearchVO searchVo){
		return getSqlSession().selectOne(namespace
				+".selectTotalRecord", searchVo);
	}
	@Override
	public int insertqna(QnaBoardVO qnaBoardVo) {
		return getSqlSession().insert(namespace+".insertqna",qnaBoardVo);
	}
	@Override
	public List<QnaBoardVO> selectqna(int cNo) {
		return getSqlSession().selectList(namespace+".selectqna",cNo);
	}
	@Override
	public int insertRepay(QnaRepayVO qnaRepayVo) {
		return getSqlSession().insert(namespace+".insertRepay",qnaRepayVo);
	}
	@Override
	public int updateRepayCheck(int cqNo) {
		return getSqlSession().update(namespace+".updateRepayCheck",cqNo);
	}
	@Override
	public List<QnaRepayVO> selectRepay() {
		return getSqlSession().selectList(namespace+".selectRepay");
	}
	@Override
	public int updateqnaDelflag(int cqNo) {
		return getSqlSession().update(namespace+".updateqnaDelflag",cqNo);
	}
	@Override
	public int updaterepayDelflag(int cqNo) {
		return getSqlSession().update(namespace+".updaterepayDelflag",cqNo);
	}
	@Override
	public int countrepay(int cqNo) {
		return getSqlSession().selectOne(namespace+".countrepay",cqNo);
	}
	@Override
	public int updateRepayCheckN(int cqNo) {
		return getSqlSession().update(namespace+".updateRepayCheckN",cqNo);
	}

}
