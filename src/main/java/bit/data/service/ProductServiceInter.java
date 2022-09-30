package bit.data.service;

import java.util.List;

import bit.data.dto.ProductDto;
import bit.data.dto.ReviewDto;

public interface ProductServiceInter {
	public List<ProductDto> getFriendWishlist(int userNum);
	public List<ProductDto> getProduct(int price);
	public List<ProductDto> getProductTheme(int themeNum);
//	public List<ProductDto> getTag(int themeNum);
	public ProductDto getProductDetail(int num);
}
