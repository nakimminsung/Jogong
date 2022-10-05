package bit.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.data.dao.CartDaoInter;
import bit.data.dto.CartListDto;

@Service
public class CartService implements CartServiceInter {
	
	@Autowired
	CartDaoInter cartDaoInter;
	
	@Override
	public List<CartListDto> getCartList(int userNum) {
		return cartDaoInter.getCartList(userNum) ;
	}

	@Override
	public void deleteCart(int cartNum) {
		cartDaoInter.deleteCart(cartNum);
	}

	@Override
	public void updateCart(int cartNum, int qty) {
		Map<String,Integer> map = new HashMap<>();
		map.put("cartNum", cartNum);
		map.put("qty", qty);
		
		cartDaoInter.updateCart(map);
	}
	
	@Override
	public void insertCart(CartListDto dto) {
		cartDaoInter.insertCart(dto);
	}
}
