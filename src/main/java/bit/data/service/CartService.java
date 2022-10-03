package bit.data.service;

import java.util.List;

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
}
