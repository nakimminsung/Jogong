package bit.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import bit.data.dto.WishlistDto;
import bit.data.service.WishlistServiceInter;

@Controller
public class WishlistController {
	
	@Autowired
	WishlistServiceInter wishlistServiceInter;
	
	@GetMapping("/wishlist/list")
	public List<WishlistDto> list(int userNum) {
		
		return wishlistServiceInter.getWishlist(userNum);
	}
	
}
