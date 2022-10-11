package bit.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.data.dao.BrandDaoInter;

@Service
public class BrandService implements BrandServiceInter {

	@Autowired
	BrandDaoInter brandDao;
	
	@Override
	public List<String> getAllBrand() {
		return brandDao.getAllBrand();
	}

}
