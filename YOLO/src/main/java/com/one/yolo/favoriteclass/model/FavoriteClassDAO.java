package com.one.yolo.favoriteclass.model;

import java.util.List;
import java.util.Map;

import com.one.yolo.common.SearchVO;

public interface FavoriteClassDAO {
	public List<Map<String, Object>> selectFavoriteClass(SearchVO searchVO);
	public int selectTotalRecord(SearchVO searchVo);
	
	
}
