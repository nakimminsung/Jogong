package bit.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.data.dto.CartListDto;
import bit.data.dto.ProductDto;
import bit.data.dto.WishlistDto;
import bit.data.service.CartServiceInter;
import bit.data.service.ProductServiceInter;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	CartServiceInter cartServiceInter;
	
	@GetMapping("/list")
	@ResponseBody
	public List<CartListDto> getCartList(int userNum) {
		return cartServiceInter.getCartList(userNum);
	}
	@GetMapping("/delete")
	public void deleteCart(int cartNum) {
		cartServiceInter.deleteCart(cartNum);
	}
	
	@PostMapping("/insert")
	@ResponseBody
	public void insert(CartListDto dto)
	{
		cartServiceInter.insertCart(dto);
	}
}
