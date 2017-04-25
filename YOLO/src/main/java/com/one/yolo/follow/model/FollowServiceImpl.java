package com.one.yolo.follow.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
