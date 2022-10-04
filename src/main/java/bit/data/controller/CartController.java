package bit.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.data.dto.CartListDto;
import bit.data.service.CartServiceInter;
import bit.data.service.ProductServiceInter;

@Controller
public class CartController {

	@Autowired
	CartServiceInter cartServiceInter;
	
	@Autowired
	ProductServiceInter productServiceInter;
	
	@GetMapping("/mypage")
	public String mypage() {
		return "/mypage/mypage/cart";
	}
	@GetMapping("/mypage/cart")
	public String cartList() {
		return "/mypage/mypage/cart";
	}
	
	@GetMapping("/cart/list")
	@ResponseBody
	public List<CartListDto> getCartList(int userNum) {
		return cartServiceInter.getCartList(userNum);
	}
	@GetMapping("/cart/delete")
	public String deleteCart(int cartNum) {
		cartServiceInter.deleteCart(cartNum);
		
		return "mypage/cart";
	}
}
