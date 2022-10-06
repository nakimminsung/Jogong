package bit.data.dao;

import java.util.List;

import bit.data.dto.OrderDto;
import bit.data.dto.ProductDto;
import bit.data.dto.UserDto;

public interface GiftDaoInter {
	public List<OrderDto> getReceiveSearch(int userNum);

	public List<OrderDto> getSendSearch(int userNum);
	
}
