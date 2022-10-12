package bit.data.dao;

import java.util.List;
import java.util.Map;

import bit.data.dto.ProductDto;

import bit.data.dto.SellerDto;

public interface BrandDaoInter {
	public List<SellerDto> getAllBrand();
	public int getTotalBrandCount(String brand);
	public List<ProductDto> getBrandByName(Map<String, Object> map);
	public List<SellerDto> selectBrandTheme(String sort);
	public SellerDto getLogoDesc(String brand);
	public List<ProductDto> getBrandAll(String brand);
	public List<SellerDto> selectBrandName(String name);
}
