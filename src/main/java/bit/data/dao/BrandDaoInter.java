package bit.data.dao;

import java.util.List;
import java.util.Map;

import bit.data.dto.ProductDto;

public interface BrandDaoInter {
	public List<String> getAllBrand();
	public int getTotalBrandCount(String brand);
	public List<ProductDto> getBrandByName(Map<String, Object> map);
	public String getLogoImg(String brand);
}
