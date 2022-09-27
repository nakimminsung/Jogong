package bit.data.dao;

import java.util.List;

import bit.data.dto.WishlistDto;

public interface ProductDaoInter {
	public List<WishlistDto> getWishlist(int userNum);
	public List<ProductDto> getProduct(int price);

}
