package bit.data.service;

import java.util.List;
import bit.data.dto.SellerDto;
import bit.data.dto.ProductDto;

public interface BrandServiceInter {
	public List<SellerDto> getAllBrand();
	public List<SellerDto> infiniteScrollDown(int bno);
	public int getTotalBrandCount(String brand);
	public List<ProductDto> getBrandByName(String brand,String sort);
	public List<SellerDto> selectBrandTheme(String sort);
	public SellerDto getLogoDesc(String brand);
	public List<ProductDto> getBrandAll(String brand);
	public List<SellerDto> selectBrandName(String name);
}
