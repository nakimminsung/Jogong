package bit.data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import bit.data.dto.OrderDetailDto;
import bit.data.service.OrderDetailServiceInter;

@Controller
@RequestMapping("/orderDetail")
public class OrderDetailController {
	@Autowired
	OrderDetailServiceInter orderDetailService;
	
	@PostMapping("/insert")
	public String insert(OrderDetailDto dto)
	{
		orderDetailService.insertOrderDetail(dto);
		int num = dto.getProductNum();
		
		//return "redirect:detail?num="+num;
		return "redirect:../payview";	
	}
}
