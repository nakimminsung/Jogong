package bit.data.service;

import java.util.List;

import bit.data.dto.WishlistDto;

public interface ProductServiceInter {
	public List<WishlistDto> getWishlist(int userNum);
}
