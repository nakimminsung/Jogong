package bit.data.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bit.data.dao.ProductDaoInter;
import bit.data.dto.CategoryDto;
import bit.data.dto.ProductDto;
import bit.data.service.ProductServiceInter;
import bit.data.service.ReviewServiceInter;


@Controller
public class ProductController {
	
	@Autowired
	ProductServiceInter productService;
	
	@Autowired
	ReviewServiceInter reviewService;
	
	@GetMapping("/")
	public String home() {
			
		return "/bit/main/main"; //WEB-INF/layout/main.jsp 가 메인페이지로
	}
	
	@GetMapping("/product/list")
	@ResponseBody
	public List<ProductDto> list(int price)		
	{
		return productService.getProduct(price);
	}
	
	@GetMapping("/product/themeList")
	@ResponseBody
	public List<ProductDto> themeList(int themeNum)		
	{
		return productService.getProductTheme(themeNum);
	}
	
//	@GetMapping("/product/tagList")
//	@ResponseBody
//	public List<ProductDto> tagList(int themeNum)		
//	{
//		return productService.getTag(themeNum);
//	}
	@GetMapping("/wishlist/friend")
	@ResponseBody
	public List<ProductDto> getFriendWishlist(int userNum)		
	{
		return productService.getFriendWishlist(userNum);
	}
	
	@GetMapping("/select/WriteableList")
	@ResponseBody
	public List<ProductDto> selectWriteableList(int userNum) {
	    return productService.selectWriteableList(userNum);
	}
	
	// 상세페이지
	@GetMapping("/product/detail")
	public ModelAndView productDetail(int num) {
		ModelAndView mview = new ModelAndView();
		ProductDto dto = productService.getProductDetail(num);
		int reviewAvg = reviewService.getRating(num);
		int reviewCount = reviewService.getRatingNum(num);
		
		// 조회수 증가
		productService.updateReadCount(num);
		
		mview.addObject("dto",dto);
		
		mview.addObject("reviewAvg", reviewAvg);
		mview.addObject("reviewCount", reviewCount);
		

		mview.setViewName("/bit/product/detail");
		
		return mview;
	}
	
	@GetMapping("/category")
	public String category(Model model) {
		List<CategoryDto> category=productService.getCategory();
		model.addAttribute("category", category);
	
		return "/bit/category/categoryMain";
	}
	
	@GetMapping("/category/categoryDetail")
	public String categoryMain(Model model,HttpServletRequest request) {
		List<CategoryDto> category=productService.getCategory();
		int categoryNum=Integer.parseInt(request.getParameter("num"));
		String categoryName=productService.getCategoryByNum(categoryNum);		
		int count=productService.getTotalProductByCateNum(categoryNum);
		String sort = "createdAt";
		
		List<ProductDto> productList = productService.getProductByNum(categoryNum, sort);
		
		model.addAttribute("category", category);
		model.addAttribute("categoryName", categoryName);
		model.addAttribute("categoryNum",categoryNum);
		model.addAttribute("totalCount",count);
		model.addAttribute("productList", productList);
		
			
		return "/bit/category/detail";
	}
	
	@GetMapping("/category/categorySort")
	@ResponseBody
	public Map<String, Object> getSort(int num, String sort){
		Map<String, Object> map= new HashMap<String, Object>();
		int categoryNum=num;
		List<ProductDto> productList = productService.getProductByNum(categoryNum, sort);
		map.put("productList", productList);
		return map;
		
	}

	// 마이페이지 리뷰작성폼시 상품데이터 get
	@GetMapping("/product/select")
	@ResponseBody
	public ProductDto selectProduct(int num) {
	    return productService.getProductDetail(num);
	}
	
<<<<<<< HEAD
	
	

	
	//Search
	@GetMapping("/search")
	public String searchList(Model model,HttpServletRequest request) {
		
		//입력받은 검색단어 가져오기
		String searchword=request.getParameter("searchword");
		
		//최초 sort 값 고정 (최신순)
		String sort = "createdAt desc";
		
		//검색결과 - 1. 갯수 가져오기
		int searchCount=productService.getSearchCount(searchword);
		
		//검색결과 - 2. 상품정보 가져오기
		List<ProductDto> searchProduct=productService.getSearchProductBySort(searchword,sort);
		
		//결과 값을 model에 담아 view로 전달하기
		model.addAttribute("searchword",searchword);
		model.addAttribute("searchCount",searchCount);
		model.addAttribute("searchProduct",searchProduct);

      return "/bit/search/searchList";
	}

	@GetMapping("/search/searchSort")
	@ResponseBody
	public Map<String, Object> getSearchSort(String searchword, String sort){
		
		Map<String, Object> map= new HashMap<String, Object>();
		
		//searchword 와 sort 값을 전달하여 List에 dto 담기
		List<ProductDto> productList = productService.getSearchProductBySort(searchword, sort);
		
		//List를 map에 담아 view로 전달하기
		map.put("productList", productList);
		
		return map;
		
	}
	
	
=======

>>>>>>> f5a98b0b3d1cac9e605819cdef7e53f8b1ed3dcd

}
