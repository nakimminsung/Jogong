package bit.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.data.dao.OrderDaoInter;
import bit.data.dto.OrderTestDto;

@Service
public class OrderService implements OrderServiceInter {

	@Autowired
	OrderDaoInter orderdao;
	
	@Override
	public List<OrderTestDto> getAllSearch() {
		// TODO Auto-generated method stub
		return orderdao.getAllSearch();
	}

	@Override
	public void insertOrder(OrderTestDto dto) {
		// TODO Auto-generated method stub
		orderdao.insertOrder(dto);
	}

}
