package bit.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.data.dao.OrderDaoInter;
import bit.data.dto.OrderDetailDto;
import bit.data.dto.OrderDto;
import bit.data.dto.ProductDto;
import bit.data.dto.UserDto;

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
	public ProductDto getItemSearch(int num) {
		// TODO Auto-generated method stub
		return orderdao.getItemSearch(num);
	}

	@Override
	public String getfriendNickNameSearch(int num) {
		// TODO Auto-generated method stub
		return orderdao.getfriendNickNameSearch(num);
	}

	@Override
	public UserDto getUserSearch(int num) {
		// TODO Auto-generated method stub
		return orderdao.getUserSearch(num);
	}

	@Override
	public OrderDetailDto getOrderDetail(int num) {
		// TODO Auto-generated method stub
		return orderdao.getOrderDetail(num);
	}

	@Override
	public void insertOrder(OrderDto dto) {
		// TODO Auto-generated method stub
		orderdao.insertOrder(dto);
	}

}
