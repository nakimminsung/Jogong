package bit.data.dao;

import java.util.List;

import bit.data.dto.WishlistDto;

public interface WishlistDaoInter {
	public List<WishlistDto> getWishlist(int userNum);
}
