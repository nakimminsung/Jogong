package bit.data.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.data.dto.ProductDto;
import bit.data.dto.WishlistDto;

@Repository
public class ProductDao implements ProductDaoInter {
	
	@Autowired
	SqlSession session;
	String ns = "bit.data.dao.ProductDao.";
	
	@Override
	public List<WishlistDto> getWishlist(int userNum) {
		return session.selectList(ns+"getWishlist",userNum);
	}

	@Override
	public List<ProductDto> getProduct(int price) {
		
		return session.selectList(ns+"selectProductByPrice", price);
	}
}
