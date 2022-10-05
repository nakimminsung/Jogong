package bit.data.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.data.dto.OrderDetailDto;
import bit.data.service.OrderDetailServiceInter;

@Controller
@RequestMapping("/orderDetail")
public class OrderDetailController {
	@Autowired
	OrderDetailServiceInter orderDetailService;
	
	@PostMapping("/insert")
	@ResponseBody
	public Map<String, Integer> insert(OrderDetailDto dto)
	{
		orderDetailService.insertOrderDetail(dto);
		int num = orderDetailService.getMaxNum();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("num",num);
		return map;	
	}
	
	// 나에게 선물하기
	@PostMapping("/insertSelfGift")
	public String insertSelfGift(OrderDetailDto dto)
	{
		orderDetailService.insertSelfGift(dto);
		int num = orderDetailService.getMaxNum();
		
		return "redirect:../payview?num="+num;	
	}
}
