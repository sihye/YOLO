package com.one.yolo.follow.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.yolo.common.SearchVO;

@Service
public class FollowServiceImpl implements FollowService{
	@Autowired
	private FollowDAO followDao;
	@Override
	public List<FollowVO> selectFollow(String userid) {
		return followDao.selectFollow(userid);
	}
	@Override
	public int deleteFollow(int flNo) {
		return followDao.deleteFollow(flNo);
	}
	@Override
	public List<Map<String, Object>> selectFollowClass(SearchVO searchVO) {
		return followDao.selectFollowClass(searchVO);
	}
	public int selectTotalRecord(SearchVO searchVo){
		return followDao.selectTotalRecord(searchVo);
	}

}
