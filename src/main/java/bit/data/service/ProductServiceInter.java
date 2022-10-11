package bit.data.service;

import java.util.List;
import java.util.Map;

import bit.data.dto.CategoryDto;
import bit.data.dto.ProductDto;

public interface ProductServiceInter {
	public List<ProductDto> getFriendWishlist(int userNum);
	public List<ProductDto> getCart(int userNum);
	public List<ProductDto> getProduct(int price);
	public List<ProductDto> getProductTheme(int themeNum);
//	public List<ProductDto> getTag(int themeNum);
	public ProductDto getProductDetail(int num);
	public List<CategoryDto> getCategory();
	public String getCategoryByNum(int categoryNum);
	public int getTotalProductByCateNum(int categoryNum);
	public List<ProductDto> getProductByNum(int categoryNum,String sort);
	public void updateReadCount(int num);
	public List<ProductDto> selectWriteableList(int userNum);

	
	//search
	public int getSearchCount(String searchword);
	public List<ProductDto> getSearchProduct(String searchword);
	public List<ProductDto> getSearchProductBySort(String searchword, String sort);
}
