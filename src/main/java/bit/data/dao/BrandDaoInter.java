package bit.data.dao;

import java.util.List;

import bit.data.dto.SellerDto;

public interface BrandDaoInter {
	public List<SellerDto> getAllBrand();
	
	public List<SellerDto> selectBrandTheme(String sort);
	
	public List<SellerDto> selectBrandName(String name);
}
