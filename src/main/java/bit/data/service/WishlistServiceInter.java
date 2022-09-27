package bit.data.service;

import java.util.List;

import bit.data.dto.WishlistDto;

public interface WishlistServiceInter {
	public List<WishlistDto> getWishlist(int userNum);
}
