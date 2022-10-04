package bit.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.data.dao.ProductDaoInter;
import bit.data.dto.ProductDto;

@Service
public class ProductService implements ProductServiceInter {
	
	@Autowired
	ProductDaoInter productDaoInter;
	
	@Override
	public List<ProductDto> getProduct(int price) {
		return productDaoInter.getProduct(price);
	}

	@Override
	public List<ProductDto> getFriendWishlist(int userNum) {
		return productDaoInter.getFriendWishlist(userNum);
	}
	
	@Override
	public List<ProductDto> getCart(int userNum) {
		return productDaoInter.getCart(userNum);
	}

	@Override
	public List<ProductDto> getProductTheme(int themeNum) {
		return productDaoInter.getProductTheme(themeNum);
	}

	@Override
	public ProductDto getProductDetail(int num) {
		
		return productDaoInter.getProductDetail(num);
	}	
//	@Override
//	public List<ProductDto> getTag(int themeNum) {
//	
//		return daoInter.getTag(themeNum);
//	}
}
