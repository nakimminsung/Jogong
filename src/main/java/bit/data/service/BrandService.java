package bit.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.data.dao.BrandDao;
import bit.data.dao.BrandDaoInter;
import bit.data.dto.SellerDto;

@Service
public class BrandService implements BrandServiceInter {

	@Autowired
	BrandDaoInter brandDao;
	
	@Override
	public List<SellerDto> getAllBrand() {
		return brandDao.getAllBrand();
	}

	@Override
	public List<SellerDto> selectBrandTheme(String sort) {
		return brandDao.selectBrandTheme(sort);
	}

	@Override
	public List<SellerDto> selectBrandName(String name) {
		// TODO Auto-generated method stub
		return brandDao.selectBrandName(name);
	}

}
