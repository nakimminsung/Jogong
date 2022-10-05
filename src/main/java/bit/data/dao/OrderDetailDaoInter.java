package bit.data.dao;

import bit.data.dto.OrderDetailDto;

public interface OrderDetailDaoInter {

	public void insertOrderDetail(OrderDetailDto dto);	
	public void insertSelfGift(OrderDetailDto dto);
	public int getMaxNum();
}
