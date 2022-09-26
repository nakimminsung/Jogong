package bit.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.data.dao.ProductDaoInter;
import bit.data.dto.WishlistDto;

@Service
public class ProductService implements ProductServiceInter {

	@Autowired
	ProductDaoInter productDao;
	
	@Override
	public List<WishlistDto> getFriendWishlist(int userNum) {
		return productDao.getFriendWishlist(userNum);
	}

}
