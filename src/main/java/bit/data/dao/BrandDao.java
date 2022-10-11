package bit.data.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.data.dto.ProductDto;
import bit.data.dto.SellerDto;

@Repository
public class BrandDao implements BrandDaoInter{

	@Autowired
	SqlSession session;
	String ns = "bit.data.dao.BrandDao.";
	
	@Override
	public List<SellerDto> getAllBrand() {
		return session.selectList(ns+"getAllBrand");
	}
	@Override
	public int getTotalBrandCount(String brand) {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"getTotalBrandCount",brand);
	}	
	@Override
	public List<SellerDto> selectBrandTheme(String sort) {
		// TODO Auto-generated method stub
		return session.selectList(ns+"selectBrandTheme",sort);
	}
	
	@Override
	public List<ProductDto> getBrandByName(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.selectList(ns+"getBrandByName",map);
	}
	
	@Override
	public String getLogoImg(String brand) {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"getLogoImg",brand);
	}
}
