package bit.data.controller;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bit.data.dto.WishlistDto;
import bit.data.service.WishlistServiceInter;

@Controller
@RequestMapping("/wishlist")
public class WishlistController {
	
	@Autowired
	WishlistServiceInter wishlistServiceInter;
	
	@GetMapping("/page")
	public String mypage() {
		return "/mypage/mypage/wishlist";
	}
	
    @GetMapping("/userPage")
    public ModelAndView wishpage(int userNum) {
        ModelAndView mview = new ModelAndView();
        int count = wishlistServiceInter.selectPublicWishCount(userNum);
        mview.addObject("userNum",userNum);
        mview.addObject("count",count);
        
        mview.setViewName("/bit/wishlist/wishlist");
        
        return mview;
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
		return "redirect:/product/detail?num="+num;
	}
	
	@GetMapping("/list")
	@ResponseBody
	public List<WishlistDto> userWishlist(int userNum) {
	    return wishlistServiceInter.selectUserWishlist(userNum);
	}
	
	@GetMapping("/publicList")
	@ResponseBody
	public List<WishlistDto> selectPublicWishlist(int userNum) {
	    return wishlistServiceInter.selectPublicWishlist(userNum);
	}
	
	@GetMapping("/delete")
	public String deleteWishlist(int num) {
	    wishlistServiceInter.deleteWishlist(num);
	    
	    return "/mypage/mypage/wishlist";
	}
	
	@GetMapping("/update")
	public void updateWishlist(
            @RequestParam("num") int num,
            @RequestParam("publicOption") boolean publicOption) {
	    
	    HashMap<String,Object> map = new HashMap<>();
	    
	    map.put("num", num);
	    map.put("publicOption", publicOption);
	    
	    wishlistServiceInter.updateWishlist(map);
	}
}
