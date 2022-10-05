package bit.data.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	public void test(   
				@RequestBody String custom_data,
				HttpServletRequest request){
			
		 System.out.println(custom_data);
		 System.out.println(request.getParameter("imp_uid"));
		 System.out.println(request.getParameter("merchant_uid"));
		 System.out.println(request.getParameter("pg"));
		 System.out.println(request.getParameter("pay_method"));
		 System.out.println(request.getParameter("name"));
		 System.out.println(request.getParameter("buyer_name"));
		 System.out.println(request.getParameter("amount"));
		 System.out.println(request.getParameter("custom_data[member_id]"));
		 System.out.println(request.getParameter("custom_data[count]"));
		 System.out.println(request.getParameter("custom_data[messagecard]"));
		 System.out.println(request.getParameter("custom_data[banner]"));
		 System.out.println(request.getParameter("custom_data[message]"));
		 System.out.println(request.getParameter("custom_data[address]"));
		 System.out.println(request.getParameter("success"));
		 

		 String imp_uid = request.getParameter("imp_uid");
		 String merchant_uid = request.getParameter("merchant_uid");
		 String pg = request.getParameter("pg");
		 String pay_method = request.getParameter("pay_method");
		 String name = request.getParameter("name");
		 String buyer_name = request.getParameter("buyer_name");
		 String amount = request.getParameter("amount");
		 String to_member_id = request.getParameter("custom_data[member_id]");
		 String count = request.getParameter("custom_data[count]");
		 String messagecard = request.getParameter("custom_data[messagecard]");
		 String banner = request.getParameter("custom_data[banner]");
		 String message = request.getParameter("custom_data[message]");
		 String success = request.getParameter("success");
		 
		OrderTestDto ordertestDto = new OrderTestDto(); 
		ordertestDto.setImp_uid(imp_uid);
		ordertestDto.setMerchant_uid(merchant_uid);
		ordertestDto.setName(name);
		ordertestDto.setAmount(Integer.parseInt(amount));
		ordertestDto.setBuyer_name(buyer_name);
		ordertestDto.setPg(pg);
		ordertestDto.setPay_method(pay_method);
		ordertestDto.setTo_member_id(to_member_id);
		ordertestDto.setCount(Integer.parseInt(count));
		ordertestDto.setMessagecard(messagecard);
		ordertestDto.setBanner(banner);
		ordertestDto.setMessage(message);
		ordertestDto.setSuccess(success);
		
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
