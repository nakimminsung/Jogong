package bit.data.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.data.dto.CartListDto;

@Repository
public class CartDao implements CartDaoInter {

	@Autowired
	SqlSession session;
	String ns="bit.data.dao.CartDao.";
	
	@Override
	public List<CartListDto> getCartList(int userNum) {
		return session.selectList(ns+"getCartList", userNum);
	}

	@Override
	public void deleteCart(int cartNum) {
		session.selectOne(ns+"deleteCart", cartNum);
	}
	
}
