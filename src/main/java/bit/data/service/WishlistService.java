package bit.data.service;

import java.util.List;
import java.util.Map;

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
    public List<WishlistDto> selectUserWishlist(int userNum) {
        return wishlistDaoInter.selectUserWishlist(userNum);
    }

    @Override
	public void insertWishlist(WishlistDto wishlistDto) {
		wishlistDaoInter.insertWishlist(wishlistDto);
	}

    @Override
    public void updateWishlist(Map<String, Object> map) {
        wishlistDaoInter.updateWishlist(map);
    }

    @Override
    public void deleteWishlist(int num) {
        wishlistDaoInter.deleteWishlist(num);
    }
	
}
