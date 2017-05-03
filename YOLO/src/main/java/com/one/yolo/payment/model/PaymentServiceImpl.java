package com.one.yolo.payment.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.one.yolo.booking.model.BookingDAO;
import com.one.yolo.booking.model.BookingService;
import com.one.yolo.booking.model.BookingVO;
import com.one.yolo.common.SearchVO;

@Service
public class PaymentServiceImpl implements PaymentService{
	private static final Logger logger=LoggerFactory.getLogger(PaymentServiceImpl.class);
	@Autowired
	private PaymentDAO paymentDao;
	@Autowired
	private BookingDAO bookDao;

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
	public int cancelCount(String pmNo) {
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

	@Override
	@Transactional
	public int insertPay(PaymentVO pVo, BookingVO bVo) {
		int cnt= bookDao.insertBooking(bVo);
		logger.info("service booking vo={} , 예약 cnt={}",bVo,cnt);
		pVo.setBkNo(bVo.getBkNo());
		if(pVo.getPmPaymentway().equals("card")){//카드결제면 결제완료
			pVo.setPmCompletecheck("Y");
		}
		logger.info("service pay vo={}",pVo);
		cnt=paymentDao.insertPay(pVo);
		logger.info("결제 cnt={}", cnt);
		return cnt;
	}
	
	
	
	
	
}
