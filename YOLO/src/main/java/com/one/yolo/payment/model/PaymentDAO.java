package com.one.yolo.payment.model;

import java.util.List;
import java.util.Map;

import com.one.yolo.common.SearchVO;

public interface PaymentDAO {
	public List<Map<String, Object>> selectPayment(SearchVO searchVO);
	public int selectTotalRecord(SearchVO searchVo);
	public int insertPaymentCancel(PaymentCancelVO paymentCancelVo);
	public int cancelCount(int pmNo);
	public int cancelcheckYN(PaymentVO paymentVo);
	public List<PaymentCancelVO> selectPaymentCancel();
	public List<Map<String, Object>> selectPaymentView(SearchVO vo);
	public int selectPaymentViewCount (SearchVO vo);
	public List<Map<String, Object>> selectPaymentCancelView(SearchVO vo);
	public int selectPaymentCancelViewCount(SearchVO vo);
}
