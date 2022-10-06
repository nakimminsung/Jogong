package bit.data.dao;

import java.util.HashMap;

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

	@Override
	public void insertSelfGift(OrderDetailDto dto) {
		session.insert(ns+"insertSelfGift", dto);
	}
	
	@Override
	public void insertSelfCart(HashMap<String,Object> map) {
	    session.insert(ns+"insertSelfCart", map);
	}

	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"getMaxNum");
	}	
}
