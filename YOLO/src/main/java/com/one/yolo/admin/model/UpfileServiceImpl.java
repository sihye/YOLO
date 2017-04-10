package com.one.yolo.admin.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UpfileServiceImpl implements UpfileService{
	
	@Autowired
	private UpfileDAO dao;

}
