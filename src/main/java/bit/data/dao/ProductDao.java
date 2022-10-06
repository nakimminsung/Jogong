package bit.data.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.data.dto.ProductDto;
import bit.data.dto.ReviewDto;

@Repository
public class ProductDao implements ProductDaoInter {
	
	@Autowired
	SqlSession session;
	String ns = "bit.data.dao.ProductDao.";

	@Override
	public List<ProductDto> getFriendWishlist(int userNum) {
		return session.selectList(ns+"getFriendWishlist",userNum);
	}
	
	@Override
	public List<ProductDto> getCart(int userNum) {
		return session.selectList(ns+"getCart",userNum);
	}

	@Override
	public List<ProductDto> getProduct(int price) {
		
		return session.selectList(ns+"selectProductByPrice", price);
	}
	
	@Override
	public List<ProductDto> getProductTheme(int themeNum) {
	
		return session.selectList(ns+"selectProductByTheme", themeNum);
	}

	@Override
	public ProductDto getProductDetail(int num) {
		
		return session.selectOne(ns+"selectProductDetail",num);
	}

//	@Override
//	public List<ProductDto> getTag(int themeNum) {
//
//		return session.selectList(ns+"selectTagByTheme", themeNum);
//	}
	
	
}
