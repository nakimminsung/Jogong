package bit.data.service;

import java.util.List;
import bit.data.dto.OrderDto;

public interface GiftServiceInter {
	public List<OrderDto> getReceiveSearch(int userNum);

	public List<OrderDto> getSendSearch(int userNum);
	
	public void updateAddressOrder(OrderDto dto);
}
