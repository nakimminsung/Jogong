package bit.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.data.dao.WishlistDaoInter;
import bit.data.dto.WishlistDto;

@Service
public class WishlistService implements WishlistServiceInter {

	@Autowired
	WishlistDaoInter wishlistDaoInter;

	@Override
	public List<WishlistDto> getWishlist(int userNum) {
	
		return wishlistDaoInter.getWishlist(userNum);
	}

	@Override
	public void insertWishlist(WishlistDto wishlistDto) {
		wishlistDaoInter.insertWishlist(wishlistDto);
	}
}
