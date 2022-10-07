package bit.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/brand")
public class BrandController {
	
	@GetMapping("/list")
	public String brandPage() {
		return "/bit/brand/brandMainPage";
	}

	@GetMapping("/detail")
	public String brandDetailPage() {
		return "/bit/brand/brandDetailPage";
	}
}
