package bit.data.dao;

import java.util.List;

import bit.data.dto.CartListDto;

public interface CartDaoInter {
	public List<CartListDto> getCartList(int userNum);
}
