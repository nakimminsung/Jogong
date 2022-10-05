package bit.data.service;

import bit.data.dto.OrderDetailDto;

public interface OrderDetailServiceInter {
	
	public void insertOrderDetail(OrderDetailDto dto);	
	public void insertSelfGift(OrderDetailDto dto);
	public int getMaxNum();
}
