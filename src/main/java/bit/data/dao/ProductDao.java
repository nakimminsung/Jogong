package bit.data.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.data.dto.CategoryDto;
import bit.data.dto.ProductDto;

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
	@Override
	public void updateReadCount(int num) {
		
		session.update(ns+"updateReadCount", num);
	}
    @Override
    public List<ProductDto> selectWriteableList(int userNum) {
        return session.selectList(ns+"selectWriteableList", userNum);
    }
//	@Override
//	public List<ProductDto> getTag(int themeNum) {
//
//		return session.selectList(ns+"selectTagByTheme", themeNum);
//	}
	
	
	@Override
	public List<CategoryDto> getCategory() {
		// TODO Auto-generated method stub
		return session.selectList(ns+"getCategory");
	}

	@Override
	public String getCategoryByNum(int categoryNum) {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"getCategoryByNum",categoryNum);
	}

	@Override
	public int getTotalProductByCateNum(int categoryNum) {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"getTotalProductByCateNum",categoryNum);
	}

	@Override
	public List<ProductDto> getProductByNum(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.selectList(ns+"getProductByNum",map);
	}
	
	
	
	
	//search
	@Override
	public int getSearchCount(String searchword) {
		
		return session.selectOne(ns+"getSearchCount",searchword);
	}
	
//	@Override
//	public List<ProductDto> getSearchProduct(String searchword) {
//		
//		return session.selectList(ns+"getSearchProduct",searchword);
//	}
	
	@Override
	public List<ProductDto> getSearchProductBySort(Map<String, Object> map) {
		
		return session.selectList(ns+"getSearchProductBySort",map);
	}
	
	
	
}
