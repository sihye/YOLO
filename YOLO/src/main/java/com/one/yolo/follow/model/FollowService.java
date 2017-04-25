package com.one.yolo.follow.model;

import java.util.List;

public interface FollowService {
	public List<FollowVO> selectFollow(String userid);
	public int deleteFollow(int flNo);
}
