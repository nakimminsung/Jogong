package bit.data.service;

import java.util.List;

import bit.data.dto.OrderDto;
import bit.data.dto.OrderTestDto;
import bit.data.dto.ProductDto;

public interface OrderServiceInter {
	
	public List<OrderDto> getAllSearch();

	public String getItemNameSearch(int num);

	public Integer getItemPriceSearch(int num);
	
	public String getItemThumbnailSearch(int num);
	
	public String getfriendNickNameSearch(int num);
	
	public String getNickNameSearch(int num);
	
	public Integer getCount(int num);
	
	public void insertOrder(OrderDto dto);

	public Integer getUserNum(int num);

	public Integer getOrderDetailNum(int num);
}
