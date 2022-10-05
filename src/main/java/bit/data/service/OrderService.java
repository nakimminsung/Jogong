package bit.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.data.dao.OrderDaoInter;
import bit.data.dto.OrderDetailDto;
import bit.data.dto.OrderDto;
import bit.data.dto.OrderTestDto;
import bit.data.dto.ProductDto;

@Service
public class OrderService implements OrderServiceInter {

	@Autowired
	OrderDaoInter orderdao;
	
	@Override
	public List<OrderDto> getAllSearch() {
		// TODO Auto-generated method stub
		return orderdao.getAllSearch();
	}

	@Override
	public String getItemNameSearch(int num) {
		// TODO Auto-generated method stub
		return orderdao.getItemNameSearch(num);
	}


	@Override
	public Integer getItemPriceSearch(int num) {
		// TODO Auto-generated method stub
		return orderdao.getItemPriceSearch(num);
	}


	@Override
	public String getItemThumbnailSearch(int num) {
		// TODO Auto-generated method stub
		return orderdao.getItemThumbnailSearch(num);
	}


	@Override
	public String getfriendNickNameSearch(int num) {
		// TODO Auto-generated method stub
		return orderdao.getfriendNickNameSearch(num);
	}

	@Override
	public String getNickNameSearch(int num) {
		// TODO Auto-generated method stub
		return orderdao.getNickNameSearch(num);
	}

	@Override
	public Integer getCount(int num) {
		// TODO Auto-generated method stub
		return orderdao.getCount(num);
	}

	@Override
	public void insertOrder(OrderDto dto) {
		// TODO Auto-generated method stub
		orderdao.insertOrder(dto);
	}

}
