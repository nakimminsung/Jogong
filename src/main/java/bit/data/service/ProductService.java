package bit.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.data.dao.ProductDaoInter;
import bit.data.dto.ProductDto;

@Service
public class ProductService implements ProductServiceInter {
	
	@Autowired
	ProductDaoInter daoInter;
	
	@Override
	public List<ProductDto> getProduct(int price) {
		return daoInter.getProduct(price);
	}

	@Override
	public List<ProductDto> getFriendWishlist(int userNum) {
		return daoInter.getFriendWishlist(userNum);
	}

	
}
