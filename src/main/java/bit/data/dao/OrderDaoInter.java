package bit.data.dao;

import java.util.List;

import bit.data.dto.OrderDetailDto;
import bit.data.dto.OrderDto;
import bit.data.dto.ProductDto;
import bit.data.dto.UserDto;

public interface OrderDaoInter {

	public List<OrderDto> getAllSearch();

	public ProductDto getItemSearch(int num);

	public String getfriendNickNameSearch(int num);
	
	public UserDto getUserSearch(int num);
	
	public OrderDetailDto getOrderDetail(int num);
	
	public void insertOrder(OrderDto dto);
	
}
