package com.one.yolo.favoriteclass.model;

import java.util.List;
import java.util.Map;

import com.one.yolo.common.SearchVO;

public interface FavoriteClassService {
	public List<Map<String, Object>> selectFavoriteClass(SearchVO searchVO);
	public int selectTotalRecord(SearchVO searchVo);
	public int deleteNoFavoriteClass(int no);
	public int deleteIdFavoriteClass(String userid);
}
