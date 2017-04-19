package com.one.yolo.favoriteclass.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.yolo.common.SearchVO;

@Service
public class FavoriteClassServiceImpl implements FavoriteClassService{
	@Autowired
	private FavoriteClassDAO favoriteClassDao;
	
	public List<Map<String, Object>> selectFavoriteClass(SearchVO searchVO){
		return favoriteClassDao.selectFavoriteClass(searchVO);
	}
	public int selectTotalRecord(SearchVO searchVo){
		return favoriteClassDao.selectTotalRecord(searchVo);
	}
}
