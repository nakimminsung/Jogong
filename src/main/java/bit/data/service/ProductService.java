package bit.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import bit.data.dao.ProductDaoInter;
import bit.data.dto.ProductDto;

public class ProductService implements ProductServiceInter {
	@Autowired
	ProductDaoInter daoInter;
	
	@Override
	public List<ProductDto> getProduct(int price) {
		return daoInter.getProduct(price);
	}
}
