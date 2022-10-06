package bit.data.dao;

import java.util.HashMap;

import bit.data.dto.OrderDetailDto;

public interface OrderDetailDaoInter {

	public void insertOrderDetail(OrderDetailDto dto);	
	public void insertSelfGift(OrderDetailDto dto);
	public void insertSelfCart(HashMap<String,Object> map);
	public int getMaxNum();
}
