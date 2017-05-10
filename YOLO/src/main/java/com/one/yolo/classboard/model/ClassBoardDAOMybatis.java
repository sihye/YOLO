package com.one.yolo.classboard.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.one.yolo.common.SearchVO;

@Repository
public class ClassBoardDAOMybatis extends SqlSessionDaoSupport implements ClassBoardDAO {
	private String namespace="config.mybatis.mapper.oracle.classboard";

	@Override
	public List<ClassBoardVO> selectClassBoard(ClassBoardVO vo) {
		return getSqlSession().selectList(namespace+".selectClassBoard",vo);
	}

	@Override
	public int selectClassBoardCount(ClassBoardVO vo) {
		return getSqlSession().selectOne(namespace+".selectClassBoardCount",vo);
	}

	@Override
	public int insertClassBoard(ClassBoardVO vo) {
		return getSqlSession().insert(namespace+".insertClassBoard",vo);
	}

	@Override
	public ClassBoardVO selectClassBoardBycbNo(int cbNo) {
		return getSqlSession().selectOne(namespace+".selectClassBoardBycbNo",cbNo);
	}

	@Override
	public int readCountUp(int cbNo) {
		return getSqlSession().update(namespace+".readCountUp",cbNo);
	}

	@Override
	public int deleteClassBoard(int cbNo) {
		return getSqlSession().delete(namespace+".deleteClassBoard",cbNo);
	}

	@Override
	public int updateClassBoard(ClassBoardVO vo) {
		
		return getSqlSession().update(namespace+".updateClassBoard",vo);
	}
	
	
	
	
}
