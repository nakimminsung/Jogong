package bit.data.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import bit.data.dto.WishlistDto;
import bit.data.service.WishlistServiceInter;

@Controller
@RequestMapping("/wishlist")
public class WishlistController {
	
	@Autowired
	WishlistServiceInter wishlistService;
	
	@PostMapping("/insert")
	public String insert(WishlistDto dto)
	{
		wishlistService.insertWishlist(dto);
		int num = dto.getProductNum();
		System.out.println(num);
		return "redirect:/product/detail?num="+num;
	}
}
