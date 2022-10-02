package bit.data.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.data.dto.OrderDetailDto;

@Repository
public class OrderDetailDao implements OrderDetailDaoInter{

	@Autowired
	SqlSession session;
	String ns = "bit.data.dao.OrderDetailDao.";
	
	@Override
	public void insertOrderDetail(OrderDetailDto dto) {
		
		session.insert(ns+"insertOrderDetail", dto);
	}
}
