package bit.data.dao;

import java.util.List;

import bit.data.dto.OrderDto;
import bit.data.dto.OrderTestDto;
import bit.data.dto.ProductDto;

public interface OrderDaoInter {

	public List<OrderDto> getAllSearch();

	public String getItemNameSearch(int Num);

	public Integer getItemPriceSearch(int Num);
	
	public String getItemThumbnailSearch(int Num);
	
	public String getfriendNickNameSearch(int Num);
	
	public String getNickNameSearch(int Num);
	
	public Integer getCount(int Num);
	
	public void insertOrder(OrderDto dto);
	
}
