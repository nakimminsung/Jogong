package bit.data.service;

import java.util.List;

import bit.data.dto.CartListDto;

public interface CartServiceInter {
	public List<CartListDto> getCartList(int userNum);
	public void deleteCart(int cartNum);
}
