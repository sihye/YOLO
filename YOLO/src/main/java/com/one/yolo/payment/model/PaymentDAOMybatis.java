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

	@Override
	public int cancelCount(String pmNo) {
		return getSqlSession().selectOne(namespace+".cancelCount",pmNo);
	}

	@Override
	public int cancelcheckYN(PaymentVO paymentVo) {
		return getSqlSession().update(namespace+".cancelcheckYN",paymentVo);
	}

	@Override
	public List<PaymentCancelVO> selectPaymentCancel() {
		return getSqlSession().selectList(namespace+".selectPaymentCancel");
	}

	@Override
	public List<Map<String, Object>> selectPaymentView(SearchVO vo) {
		return getSqlSession().selectList(namespace+".selectPaymentView",vo);
	}

	@Override
	public int selectPaymentViewCount(SearchVO vo) {
		return getSqlSession().selectOne(namespace+".selectPaymentViewCount",vo);
	}

	@Override
	public List<Map<String, Object>> selectPaymentCancelView(SearchVO vo) {
		return getSqlSession().selectList(namespace+".selectPaymentCancelView",vo);
	}

	@Override
	public int selectPaymentCancelViewCount(SearchVO vo) {
		return getSqlSession().selectOne(namespace+".selectPaymentCancelViewCount",vo);
	}

	@Override
	public int insertPay(PaymentVO vo) {
		return getSqlSession().insert(namespace+".insertPay", vo);
	}
	
	
}
