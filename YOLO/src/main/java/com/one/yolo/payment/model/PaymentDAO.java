package com.one.yolo.payment.model;

import java.util.List;
import java.util.Map;

import com.one.yolo.common.SearchVO;

public interface PaymentDAO {
	public List<Map<String, Object>> selectPayment(SearchVO searchVO);
	public int selectTotalRecord(SearchVO searchVo);
}
