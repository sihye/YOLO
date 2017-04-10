package com.one.yolo.admin.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
public class OperatorDAOMybatis extends SqlSessionDaoSupport implements OperAtorDAO{
	
	private String namespace="config.mybatis.mapper.oracle.member";
	
}
