package bit.data.dao;

import java.util.List;
import java.util.Map;

import bit.data.dto.ProductDto;

import bit.data.dto.SellerDto;

public interface BrandDaoInter {
	public int getTotalBrandCount(String brand);
	public List<ProductDto> getBrandByName(Map<String, Object> map);
	public String getLogoImg(String brand);
	public List<SellerDto> getAllBrand();
	public List<SellerDto> selectBrandTheme(String sort);
}
