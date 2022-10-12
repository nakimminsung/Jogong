package bit.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/friend")
public class FriendController {
	
//	@Autowired
//	WishlistServiceInter wishlistServiceInter;
	
	@GetMapping("/page")
	public String friendPage() {
		return "/mypage/mypage/friend";
	}
}
