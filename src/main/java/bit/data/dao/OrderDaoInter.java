package bit.data.dao;

import java.util.List;

import bit.data.dto.OrderTestDto;

public interface OrderDaoInter {

	public List<OrderTestDto> getAllSearch();
	
	public void insertOrder(OrderTestDto dto);
	
}
