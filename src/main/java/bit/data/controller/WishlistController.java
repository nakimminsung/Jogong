package bit.data.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import bit.data.dto.WishlistDto;
import bit.data.service.WishlistServiceInter;

@Controller
@RequestMapping("/wishlist")
public class WishlistController {
	
	@Autowired
	WishlistServiceInter wishlistServiceInter;
	
	@GetMapping("/mypage/wishlist")
	public String mypage() {
		return "/mypage/mypage/wishlist";
	}
	
	@PostMapping("/cart_insert")
	public String insertWishlist(
			@RequestParam("userNum") int userNum,
            @RequestParam("productNum") int productNum,
            @RequestParam("publicOption") boolean publicOption) {
		
		WishlistDto wishlistDto = new WishlistDto();
		wishlistDto.setUserNum(userNum);
		wishlistDto.setProductNum(productNum);
		wishlistDto.setPublicOption(publicOption);

		wishlistServiceInter.insertWishlist(wishlistDto);
		
		return "/mypage/cart";
	}
	
	@PostMapping("/insert")
	public String insert(WishlistDto dto)
	{
		wishlistServiceInter.insertWishlist(dto);
		int num = dto.getProductNum();
		System.out.println(num);
		return "redirect:/product/detail?num="+num;
	}
}
