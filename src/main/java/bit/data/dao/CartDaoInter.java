package bit.data.dao;

import java.util.List;
import java.util.Map;

import bit.data.dto.CartListDto;

public interface CartDaoInter {
	public List<CartListDto> getCartList(int userNum);
	public void deleteCart(int cartNum);
	public void updateCart(Map<String,Integer> map);
}
