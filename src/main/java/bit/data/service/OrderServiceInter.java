package bit.data.service;

import java.util.List;

import bit.data.dto.OrderDto;
import bit.data.dto.OrderTestDto;

public interface OrderServiceInter {
	
	public List<OrderTestDto> getAllSearch();
	
	public void insertOrder(OrderTestDto dto);
}
