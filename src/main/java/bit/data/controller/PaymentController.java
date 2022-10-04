package bit.data.controller;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonParser;

import bit.data.dto.OrderTestDto;
import bit.data.dto.OrdercustomDto;
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

		 
//		 JSONParser jparser=new JSONParser();
//	      try {
//	         Object obj=jparser.parse(custom_data);
//	         JSONObject jobj=(JSONObject)obj;
//	         System.out.println("custom_data="+jobj.get("custom_data"));
//	      } catch (ParseException e) {
//	         e.printStackTrace();
//	      }
//	      Map<String, String> m=new HashMap<String, String>();
//	      m.put("custom_data", custom_data);
//	      return m;

//		System.out.println(customData.toString());
//		JSONParser parser = new JSONParser();
//		Object obj = parser.parse(customData);
		
//		JSONObject jsonObj = (JSONObject) obj;
//		String count = (String)jsonObj.get("count");
//		String to_member_id = (String)jsonObj.get("member_id");
//		System.out.println(count);
		
//		OrderTestDto ordertestDto = new OrderTestDto(); 
//		ordertestDto.setImp_uid(imp_uid);
//		ordertestDto.setMerchant_uid(merchant_uid);
//		ordertestDto.setName(name);
//		ordertestDto.setAmount(amount);
//		ordertestDto.setBuyer_name(buyer_name);
//		ordertestDto.setPg(pg);
//		ordertestDto.setPay_method(pay_method);
//		ordertestDto.setTo_member_id(to_member_id);
//		ordertestDto.setCount(Integer.parseInt(count));
//		ordertestDto.setMessagecard(messagecard);
//		ordertestDto.setBanner(banner);
//		ordertestDto.setMessage(message);
		
//		ordersevice.insertOrder(ordertestDto);
		
	}
	
	private void JSONArray() {
		// TODO Auto-generated method stub
		
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
