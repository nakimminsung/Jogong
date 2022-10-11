package bit.data.service;

import java.util.List;

import bit.data.dto.SellerDto;

public interface BrandServiceInter {
	public List<SellerDto> getAllBrand();
	
	public List<SellerDto> selectBrandTheme(String sort);
	
	public List<SellerDto> selectBrandName(String name);
}
