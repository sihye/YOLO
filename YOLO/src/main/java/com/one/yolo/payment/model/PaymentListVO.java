package com.one.yolo.payment.model;

import java.util.List;

public class PaymentListVO {
	private List<PaymentVO>payList;

	public List<PaymentVO> getPayList() {
		return payList;
	}

	public void setPayList(List<PaymentVO> payList) {
		this.payList = payList;
	}

	@Override
	public String toString() {
		return "PaymentListVO [payList=" + payList + "]";
	}
	
	
	
	
	
}
