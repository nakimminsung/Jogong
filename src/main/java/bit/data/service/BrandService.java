package bit.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.data.dao.BrandDaoInter;
import bit.data.dto.ProductDto;
import bit.data.dto.SellerDto;

@Service
public class BrandService implements BrandServiceInter {

	@Autowired
	BrandDaoInter brandDaoInter;
	
	@Override
	public List<SellerDto> getAllBrand() {
		return brandDaoInter.getAllBrand();
	}
	@Override
	public List<ProductDto> getBrandByName(String brand, String sort) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sort", sort);
		map.put("brand", brand);
		return brandDaoInter.getBrandByName(map);
	}
	@Override
	public int getTotalBrandCount(String brand) {
		// TODO Auto-generated method stub
		return brandDaoInter.getTotalBrandCount(brand);
	}
	
	@Override
	public List<SellerDto> selectBrandTheme(String sort) {
		return brandDaoInter.selectBrandTheme(sort);
	}
	@Override
	public SellerDto getLogoDesc(String brand) {
		// TODO Auto-generated method stub
		return brandDaoInter.getLogoDesc(brand);
	}
	
	@Override
	public List<ProductDto> getBrandAll(String brand) {
		// TODO Auto-generated method stub
		return brandDaoInter.getBrandAll(brand);
	}
}
