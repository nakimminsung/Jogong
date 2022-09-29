package bit.data.service;

import java.util.List;

import bit.data.dto.ProductDto;

public interface ProductServiceInter {
	public List<ProductDto> getFriendWishlist(int userNum);
	public List<ProductDto> getProduct(int price);
	public List<ProductDto> getProductTheme(int themeNum);
	public List<ProductDto> getTag(int themeNum);
}
