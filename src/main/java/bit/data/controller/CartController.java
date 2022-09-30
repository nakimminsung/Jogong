package bit.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.data.dto.CartListDto;
import bit.data.service.CartServiceInter;

@Controller
public class CartController {

	@Autowired
	CartServiceInter cartServiceInter;
	
	@GetMapping("/cart/list")
	@ResponseBody
	public List<CartListDto> getCartList(int userNum) {
		return cartServiceInter.getCartList(userNum);
	}
}
