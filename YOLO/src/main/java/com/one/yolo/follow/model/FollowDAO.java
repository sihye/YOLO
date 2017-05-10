package com.one.yolo.follow.model;

import java.util.List;
import java.util.Map;

import com.one.yolo.common.SearchVO;

public interface FollowDAO {
	public List<FollowVO> selectFollow(String userid);
	public int deleteFollow(int flNo);
	public List<Map<String, Object>> selectFollowClass(SearchVO searchVO);
	public int selectTotalRecord(SearchVO searchVo);
	public int insertFollow(FollowVO followVo);
	public int selectFollowCount(FollowVO followVo);
}
