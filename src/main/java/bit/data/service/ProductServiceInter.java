package bit.data.service;

import java.util.List;

import org.springframework.stereotype.Service;

import bit.data.dto.ProductDto;

@Service
public interface ProductServiceInter {
	public List<ProductDto> getProduct(int price);
}
