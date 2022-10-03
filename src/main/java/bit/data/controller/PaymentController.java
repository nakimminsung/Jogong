package bit.data.controller;



import java.util.List;
import java.util.Map;



import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bit.data.dto.OrderTestDto;
import bit.data.service.OrderServiceInter;

@Controller
public class PaymentController {
	
	@Autowired
	OrderServiceInter ordersevice;
	
	@Autowired
	SqlSession sqlsession;
	
//	@GetMapping("/payview")
//	public String payview() {
//		return "/bit/payment/payview";
//	}
	
	@GetMapping("/GiftTestForm")
	public String GiftTestForm() {
		return "/bit/payment/GiftTestForm";
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
	                 @RequestParam(value = "custom_data", required=false) String to_member_id ,  
	                 @RequestParam(value = "messagecard", required=false) String messagecard ,  
	                 @RequestParam(value = "banner", required=false) String banner ,  
	                 @RequestParam(value = "message", required=false) String message ,  
	                 HttpServletRequest request){
		OrderTestDto ordertestDto = new OrderTestDto(); 
		ordertestDto.setImp_uid(imp_uid);
		ordertestDto.setMerchant_uid(merchant_uid);
		ordertestDto.setName(name);
		ordertestDto.setAmount(amount);
		ordertestDto.setBuyer_name(buyer_name);
		ordertestDto.setPg(pg);
		ordertestDto.setPay_method(pay_method);
		ordertestDto.setTo_member_id(to_member_id);
//		ordertestDto.setCount(count);
		ordertestDto.setMessagecard(messagecard);
		ordertestDto.setBanner(banner);
		ordertestDto.setMessage(message);
		
		ordersevice.insertOrder(ordertestDto);
		
	}
	
	@PostMapping("/payview")
	public ModelAndView payread(@RequestParam Map<String, String> map,
			HttpServletRequest request) {
		
		Integer price = Integer.parseInt(request.getParameter("price"));
    	Integer count = Integer.parseInt(request.getParameter("count"));
    	
    	Integer totalprice = price * count;
		
		ModelAndView mview = new ModelAndView();
		mview.addObject("sangpum",map.get("sangpum"));
		mview.addObject("price",map.get("price"));
		mview.addObject("to_member_id",map.get("to_member_id"));
		mview.addObject("count",map.get("count"));
		
		mview.addObject("totalprice",totalprice);
		
		mview.setViewName("payment/payview");
		
		//System.out.println(totalprice);
	
		return mview;
	}
	

}
