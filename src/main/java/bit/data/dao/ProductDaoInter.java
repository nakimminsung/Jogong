package bit.data.dao;

import java.util.List;

import bit.data.dto.ProductDto;

public interface ProductDaoInter {
	public List<ProductDto> getProduct(int price);
}
