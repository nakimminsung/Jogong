package bit.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/search")
public class SearchController {
	
		//tiles에 bit/*/* 로 되어있기때문에 맞춰줘야 에러나지않음
		
		//검색 메인
		@GetMapping("/searchMain")
		public String searchMain() {

			
	      return "/bit/search/searchMain";
		}
	
	
	
	
}
