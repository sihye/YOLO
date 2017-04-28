package com.one.yolo.payment.model;

import java.util.List;
import java.util.Map;

import com.one.yolo.common.SearchVO;

public interface PaymentService {
	public int selectTotalRecord(SearchVO searchVo);
	public List<Map<String, Object>> selectPayment(SearchVO searchVO);
	public int insertPaymentCancel(PaymentCancelVO paymentCancelVo);
	public int cancelCount(int pmNo);
	public int cancelcheckYN(PaymentVO paymentVo);
	public List<PaymentCancelVO> selectPaymentCancel();
}
