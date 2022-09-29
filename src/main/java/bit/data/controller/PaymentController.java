package bit.data.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import bit.data.dto.OrderTestDto;
import bit.data.service.OrderServiceInter;

@Controller
public class PaymentController {
	
	@Autowired
	OrderServiceInter ordersevice;
	
	@Autowired
	SqlSession sqlsession;
	
	@GetMapping("/payview")
	public String payview() {
		return "/bit/payment/payview";
	}
	
	@RequestMapping(value = "/test.action", method = { RequestMethod.POST })
	@ResponseBody
	public void test(@RequestParam(value="imp_uid",required=false) String imp_uid,
	                 @RequestParam(value="merchant_uid",required=false) String merchant_uid,
	                 @RequestParam(value = "name",required=false) String name,
	                 @RequestParam(value = "amount",defaultValue="10")Integer amount,
	                 @RequestParam(value = "buyer_name",required=false) String buyer_name,
	                 @RequestParam(value = "pg",required=false) String pg,
	                 @RequestParam(value = "pay_method",required=false) String pay_method,
	                 HttpServletRequest request){
		OrderTestDto ordertestDto = new OrderTestDto(); 
		ordertestDto.setImp_uid(imp_uid);
		ordertestDto.setMerchant_uid(merchant_uid);
		ordertestDto.setName(name);
		ordertestDto.setAmount(amount);
		ordertestDto.setBuyer_name(buyer_name);
		ordertestDto.setPg(pg);
		ordertestDto.setPay_method(pay_method);
		
		ordersevice.insertOrder(ordertestDto);
		
		System.out.println();
	}
}
