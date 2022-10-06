package bit.data.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.data.dto.CartListDto;
import bit.data.service.CartServiceInter;
import bit.data.service.ProductServiceInter;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	CartServiceInter cartServiceInter;

	@Autowired
	ProductServiceInter productServiceInter;
	
	@GetMapping("/list")
	@ResponseBody
	public List<CartListDto> getCartList(int userNum) {
		return cartServiceInter.getCartList(userNum);
	}
	
	// 단건삭제
	@GetMapping("/delete")
	public String deleteCart(int cartNum) {
		cartServiceInter.deleteCart(cartNum);
		
		return "mypage/cart";
	}
	
	// 선택삭제
	@PostMapping("/checkDelete")
	public String deleteCart(
	        @RequestBody HashMap<String,Object> params) {
	    
	    HashMap<String,Object> map = new HashMap<>();
	    
	    List<Integer> deleteList = (List<Integer>) params.get("cartDeleteList");
	    
	    map.put("deleteList", deleteList);
	    
	    cartServiceInter.deleteCheckCart(map);
	    
	    return "mypage/cart";
	}
	
	@GetMapping("/update")
	public String updateCart(int cartNum, int qty) {
		cartServiceInter.updateCart(cartNum, qty);
		
		return "mypage/cart";
	}
	
	@PostMapping("/insert")
	@ResponseBody
	public void insert(CartListDto dto)
	{
		cartServiceInter.insertCart(dto);
	}
}
