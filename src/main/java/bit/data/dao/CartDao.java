package bit.data.dao;

import java.util.List;
import java.util.Map;

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

	@Override
	public void updateCart(Map<String,Integer> map) {
		session.selectOne(ns+"updateCart", map);
	}
	
	public void insertCart(CartListDto dto) {
		session.insert(ns+"insertCart", dto);
	}
}
