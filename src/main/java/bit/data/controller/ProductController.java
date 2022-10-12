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
	


}
