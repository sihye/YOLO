package com.one.yolo.payment.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.one.yolo.common.SearchVO;

@Repository
public class PaymentDAOMybatis extends SqlSessionDaoSupport implements PaymentDAO{
	private String namespace="config.mybatis.mapper.oracle.payment";
	
	@Override
	public List<Map<String, Object>> selectPayment(SearchVO searchVO) {
		return getSqlSession().selectList(namespace+".selectPayment",searchVO);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return getSqlSession().selectOne(namespace
				+".selectTotalRecord", searchVo);
	}

	@Override
	public int insertPaymentCancel(PaymentCancelVO paymentCancelVo) {
		return getSqlSession().insert(namespace+".insertPaymentCancel",paymentCancelVo);
	}

}
