package bit.data.service;

import java.util.List;
import java.util.Map;

import bit.data.dto.WishlistDto;

public interface WishlistServiceInter {
	public List<WishlistDto> getWishlist(int userNum);
	public List<WishlistDto> selectUserWishlist(int userNum);
	public void insertWishlist (WishlistDto wishlistDto);
    public void updateWishlist (Map<String,Object> map);
    public void deleteWishlist (int num);
}
