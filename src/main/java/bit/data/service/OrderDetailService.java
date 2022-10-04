package bit.data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.data.dao.OrderDetailDaoInter;
import bit.data.dto.OrderDetailDto;

@Service
public class OrderDetailService implements OrderDetailServiceInter {
	@Autowired
	OrderDetailDaoInter orderDetailDaoInter;
	
	@Override
	public void insertOrderDetail(OrderDetailDto dto) {
		
		orderDetailDaoInter.insertOrderDetail(dto);	
	}

	@Override
	public void insertSelfGift(OrderDetailDto dto) {
		orderDetailDaoInter.insertSelfGift(dto);	
	}
}
