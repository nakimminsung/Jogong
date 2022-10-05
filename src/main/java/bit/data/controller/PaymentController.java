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
   
//   @GetMapping("/payview")
//   public String payview() {
//      return "/bit/payment/payview";
//   }
   
   @GetMapping("/GiftTestForm")
   public String GiftTestForm() {
      return "/bit/payment/GiftTestForm";
   }
   
   @RequestMapping(value = "/test.action", method = { RequestMethod.POST })
   @ResponseBody
   public void test(   
            @RequestBody String custom_data,
            HttpServletRequest request){
	   String imp_uid = request.getParameter("imp_uid");
       String merchant_uid = request.getParameter("merchant_uid");
       String pg = request.getParameter("pg");
       String pay_method = request.getParameter("pay_method");
       String name = request.getParameter("name");
       
//       String buyer_addr = request.getParameter("buyer_addr");
       String buyer_name = request.getParameter("buyer_name");
       String buyer_tel = request.getParameter("buyer_tel");
//       String buyer_postcode = request.getParameter("buyer_postcode");
       String amount = request.getParameter("amount");
       
       String to_member_id = request.getParameter("custom_data[member_id]");
       String count = request.getParameter("custom_data[count]");
       String messagecard = request.getParameter("custom_data[messagecard]");
       String banner = request.getParameter("custom_data[banner]");
       String message = request.getParameter("custom_data[message]");
       String buyer_addr = request.getParameter("custom_data[buyer_addr]");
       String buyer_postcode = request.getParameter("custom_data[buyer_postcode]");
       
       String point = request.getParameter("custom_data[point]");
       
       System.out.println(buyer_addr);
       System.out.println(buyer_tel);
       System.out.println(buyer_postcode);
//       String imp_uid = request.getParameter("imp_uid");
//       String merchant_uid = request.getParameter("merchant_uid");
//       String pg = request.getParameter("pg");
//       String pay_method = request.getParameter("pay_method");
//       String name = request.getParameter("name");
//       
//       String buyer_addr = request.getParameter("buyer_addr");
//       String buyer_name = request.getParameter("buyer_name");
//       String buyer_tel = request.getParameter("buyer_tel");
//       String buyer_postcode = request.getParameter("buyer_postcode");
//       String amount = request.getParameter("amount");
//       
//       String to_member_id = request.getParameter("custom_data[member_id]");
//       String count = request.getParameter("custom_data[count]");
//       String messagecard = request.getParameter("custom_data[messagecard]");
//       String banner = request.getParameter("custom_data[banner]");
//       String message = request.getParameter("custom_data[message]");
//       
//       String point = request.getParameter("custom_data[point]");
       
      OrderTestDto ordertestDto = new OrderTestDto(); 
      ordertestDto.setImp_uid(imp_uid);
      ordertestDto.setMerchant_uid(merchant_uid);
      ordertestDto.setPg(pg);
      ordertestDto.setPay_method(pay_method);
      ordertestDto.setName(name);
      
      ordertestDto.setAddr(buyer_addr);
      ordertestDto.setBuyer_name(buyer_name);
      ordertestDto.setHp(buyer_tel);
      ordertestDto.setPostalcode(buyer_postcode);
      ordertestDto.setAmount(Integer.parseInt(amount));
      
      ordertestDto.setTo_member_id(to_member_id);
      ordertestDto.setCount(Integer.parseInt(count));
      ordertestDto.setMessagecard(messagecard);
      ordertestDto.setBanner(banner);
      ordertestDto.setMessage(message);
      
      ordertestDto.setPoint(Integer.parseInt(point));
      
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
      mview.addObject("point",map.get("point"));
      
      
      mview.setViewName("/bit/payment/payview");
      
      //System.out.println(totalprice);
   
      return mview;
   }
   

}