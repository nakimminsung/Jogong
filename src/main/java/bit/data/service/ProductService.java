package bit.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.data.dao.ProductDaoInter;
import bit.data.dto.ProductDto;
import bit.data.dto.WishlistDto;

@Service
public class ProductService implements ProductServiceInter {
	@Autowired
	ProductDaoInter daoInter;
	
	@Override
	public List<ProductDto> getProduct(int price) {
		return daoInter.getProduct(price);
	}

	@Override
	public List<WishlistDto> getWishlist(int userNum) {
		return daoInter.getWishlist(userNum);
	}
	
	@Override
	public List<ProductDto> getProductTheme(int themeNum) {
		return daoInter.getProductTheme(themeNum);
	}

	@Override
	public List<ProductDto> getTag(int themeNum) {
	
		return daoInter.getTag(themeNum);
	}
}
