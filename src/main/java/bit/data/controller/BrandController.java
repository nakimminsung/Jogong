package bit.data.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import bit.data.dto.ProductDto;
import bit.data.service.BrandService;
import bit.data.service.BrandServiceInter;

@Controller
@RequestMapping("/brand")
public class BrandController {
	
	@Autowired
	BrandServiceInter brandService;
	
	@GetMapping("/list")
	public String brandPage() {
		return "/bit/brand/brandMainPage";
	}

//	@GetMapping("/detail")
//	public String brandDetailPage() {
//		return "/bit/brand/brandDetailPage";
//	}
	
	//브랜드리스트
	@GetMapping("/detail")
	
	public String brandMain(Model model,HttpServletRequest request , String brand) {
		String logo = brandService.getLogoImg(brand);
		
		model.addAttribute("logo",logo);
		
		System.out.println(brand);
		System.out.println(logo);
		
		return "/bit/brand/brandDetailPage";
	}
}
