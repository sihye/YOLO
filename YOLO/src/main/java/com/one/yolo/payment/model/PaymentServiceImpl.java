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

	@Override
	public int insertPaymentCancel(PaymentCancelVO paymentCancelVo) {
		return paymentDao.insertPaymentCancel(paymentCancelVo);
	}

	@Override
	public int cancelCount(int pmNo) {
		return paymentDao.cancelCount(pmNo);
	}

	@Override
	public int cancelcheckYN(PaymentVO paymentVo) {
		return paymentDao.cancelcheckYN(paymentVo);
	}

	@Override
	public List<PaymentCancelVO> selectPaymentCancel() {
		return paymentDao.selectPaymentCancel();
	}

	@Override
	public List<Map<String, Object>> selectPaymentView(SearchVO vo) {
		return paymentDao.selectPaymentView(vo);
	}

	@Override
	public int selectPaymentViewCount(SearchVO vo) {
		return paymentDao.selectPaymentViewCount(vo);
	}

	@Override
	public List<Map<String, Object>> selectPaymentCancelView(SearchVO vo) {
		return paymentDao.selectPaymentCancelView(vo);
	}

	@Override
	public int selectPaymentCancelViewCount(SearchVO vo) {
		return paymentDao.selectPaymentCancelViewCount(vo);
	}
	
	
	
	
	
}
