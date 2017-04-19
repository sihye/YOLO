package com.one.yolo.payment.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.yolo.common.SearchVO;

@Service
public class PaymentServiceImpl implements PaymentService{
	
	@Autowired
	private PaymentDAO paymentDao;

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return paymentDao.selectTotalRecord(searchVo);
	}

	@Override
	public List<Map<String, Object>> selectPayment(SearchVO searchVO) {
		return paymentDao.selectPayment(searchVO);
	}
}
