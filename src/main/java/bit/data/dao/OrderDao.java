package bit.data.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.data.dto.OrderTestDto;

@Repository
public class OrderDao implements OrderDaoInter {
	
	@Autowired
	SqlSession session;
	String ns = "bit.data.dao.OrderDao.";
	
	@Override
	public List<OrderTestDto> getAllSearch() {
		// TODO Auto-generated method stub
		return session.selectList(ns+"getAllSearch");
	}

	@Override
	public void insertOrder(OrderTestDto dto) {

		session.insert(ns+"insertOrder",dto);
	}

}
