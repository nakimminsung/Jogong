package bit.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.data.dto.ProductDto;
import bit.data.service.ProductServiceInter;


@Controller
public class ProductController {
	
	@Autowired
	ProductServiceInter productService;
	
	@GetMapping("/product/detail")
	public String detail() {
		
		return "/bit/product/detail";
	}
	
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
}
