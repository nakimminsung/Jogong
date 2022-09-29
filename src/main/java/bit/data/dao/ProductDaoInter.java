package bit.data.dao;

import java.util.List;

import bit.data.dto.ProductDto;

public interface ProductDaoInter {
	public List<ProductDto> getFriendWishlist(int userNum);
	public List<ProductDto> getProduct(int price);
	public List<ProductDto> getProductTheme(int themeNum);
	public List<ProductDto> getTag(int themeNum);
}
