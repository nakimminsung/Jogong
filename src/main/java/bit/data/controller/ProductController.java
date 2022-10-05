package bit.data.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bit.data.dto.FaqDto;
import bit.data.dto.NoticeDto;
import bit.data.dto.ProductDto;
import bit.data.dto.QnaCategoryDto;
import bit.data.dto.ReviewDto;
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
	
	// 상세페이지
	@GetMapping("/product/detail")
	public ModelAndView productDetail(int num) {
		ModelAndView mview = new ModelAndView();
		ProductDto dto = productService.getProductDetail(num);
		int reviewAvg = reviewService.getRating(num);
		int reviewCount = reviewService.getRatingNum(num);
		
		mview.addObject("dto",dto);
		
		mview.addObject("reviewAvg", reviewAvg);
		mview.addObject("reviewCount", reviewCount);
		

		mview.setViewName("/bit/product/detail");
		
		return mview;
	}
}
