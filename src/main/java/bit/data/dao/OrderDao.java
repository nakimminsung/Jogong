package bit.data.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.data.dto.OrderDetailDto;
import bit.data.dto.OrderDto;
import bit.data.dto.ProductDto;
import bit.data.dto.UserDto;

@Repository
public class OrderDao implements OrderDaoInter {
	
	@Autowired
	SqlSession session;
	String ns = "bit.data.dao.OrderDao.";
	
	@Override
	public List<OrderDto> getAllSearch() {
		// TODO Auto-generated method stub
		return session.selectList(ns+"getAllSearch");
	}

	@Override
	public ProductDto getItemSearch(int num) {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"getItemSearch",num);
	}

	@Override
	public String getfriendNickNameSearch(int num) {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"getfriendNickNameSearch",num);
	}

	@Override
	public UserDto getUserSearch(int num) {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"getUserSearch", num);
	}

	@Override
	public OrderDetailDto getOrderDetail(int num) {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"getOrderDetail",num);
	}

	@Override
	public void insertOrder(OrderDto dto) {
		// TODO Auto-generated method stub
		session.insert(ns+"insertOrder",dto);
	}

}
