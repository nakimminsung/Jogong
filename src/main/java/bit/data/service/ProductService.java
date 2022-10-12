package bit.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.data.dao.ProductDaoInter;
import bit.data.dto.CategoryDto;
import bit.data.dto.ProductDto;

@Service
public class ProductService implements ProductServiceInter {
	
	@Autowired
	ProductDaoInter productDaoInter;
	
	@Override
	public List<ProductDto> getProduct(int price) {
		return productDaoInter.getProduct(price);
	}

	@Override
	public List<ProductDto> getFriendWishlist(int userNum) {
		return productDaoInter.getFriendWishlist(userNum);
	}
	
	@Override
	public List<ProductDto> getCart(int userNum) {
		return productDaoInter.getCart(userNum);
	}

	@Override
	public List<ProductDto> getProductTheme(int themeNum) {
		return productDaoInter.getProductTheme(themeNum);
	}

	@Override
	public ProductDto getProductDetail(int num) {
		
		return productDaoInter.getProductDetail(num);
	}

	@Override
	public void updateReadCount(int num) {
		
		productDaoInter.updateReadCount(num);	
	}	
	
//	@Override
//	public List<ProductDto> getTag(int themeNum) {
//	
//		return daoInter.getTag(themeNum);
//	}

	@Override
	public List<CategoryDto> getCategory() {
		// TODO Auto-generated method stub
		return productDaoInter.getCategory();
	}

	@Override
	public String getCategoryByNum(int categoryNum) {
		// TODO Auto-generated method stub
		return productDaoInter.getCategoryByNum(categoryNum);
	}

	@Override
	public int getTotalProductByCateNum(int categoryNum) {
		// TODO Auto-generated method stub
		return productDaoInter.getTotalProductByCateNum(categoryNum);
	}

	@Override
	public List<ProductDto> getProductByNum(int categoryNum, String sort) {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("categoryNum", categoryNum);
		map.put("sort", sort);
		
		return productDaoInter.getProductByNum(map);
	}

    @Override
    public List<ProductDto> selectWriteableList(int userNum) {
        return productDaoInter.selectWriteableList(userNum);
    }

    
    
    //search
    @Override
    public int getSearchCount(String searchword) {
    
    	return productDaoInter.getSearchCount(searchword);
    }
    
//    @Override
//    public List<ProductDto> getSearchProduct(String searchword) {
//    	
//    
//    	return productDaoInter.getSearchProduct(searchword);
//    }
    
    @Override
    public List<ProductDto> getSearchProductBySort(String searchword, String sort) {
    	
    	Map<String, Object> map=new HashMap<String, Object>();
		map.put("searchword", searchword);
		map.put("sort", sort);
    
    	return productDaoInter.getSearchProductBySort(map);
    }
	
}
