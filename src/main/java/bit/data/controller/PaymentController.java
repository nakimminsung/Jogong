package bit.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PaymentController {
	
	@GetMapping("/payview")
	public String payview() {
		
		return "/bit/payment/payview";
	}
	
	@RequestMapping(value = "/", method = {RequestMethod.POST})
	public void test(@RequestParam("imp_uid") String imp_uid,
			@RequestParam("merchant_uid") String merchant_uid) {
		System.out.println("imp_uid");
		System.out.println("merchant_uid");
	}
}
