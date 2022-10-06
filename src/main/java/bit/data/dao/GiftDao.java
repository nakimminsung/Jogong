package bit.data.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.data.dto.OrderDto;
import bit.data.dto.ProductDto;
import bit.data.dto.UserDto;

@Repository
public class GiftDao implements GiftDaoInter{

	@Autowired
	SqlSession session;
	String ns="bit.data.dao.GiftDao.";
	
	@Override
	public List<OrderDto> getReceiveSearch(int userNum) {
		// TODO Auto-generated method stub
		return session.selectList(ns+"getReceiveSearch",userNum);
	}
	@Override
	public List<OrderDto> getSendSearch(int userNum) {
		// TODO Auto-generated method stub
		return session.selectList(ns+"getSendSearch",userNum);
	}
	
}
