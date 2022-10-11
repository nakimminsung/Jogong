package bit.data.service;

import java.util.List;

import bit.data.dto.ProductDto;

public interface BrandServiceInter {
	public List<String> getAllBrand();
	public int getTotalBrandCount(String brand);
	public List<ProductDto> getBrandByName(String brand,String sort);
	public String getLogoImg(String brand);
	
}
