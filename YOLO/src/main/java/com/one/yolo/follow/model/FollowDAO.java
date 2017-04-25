package com.one.yolo.follow.model;

import java.util.List;

public interface FollowDAO {
	public List<FollowVO> selectFollow(String userid);
	public int deleteFollow(int flNo);
}
