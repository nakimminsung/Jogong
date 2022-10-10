package bit.data.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import bit.data.dto.OrderDto;
import bit.data.service.GiftServiceInter;

@Controller
@RequestMapping("/gift")
public class GiftController {

	@Autowired
	GiftServiceInter giftservice;
	
	@Autowired
	SqlSession sqlsession;
	
	@GetMapping("/presentForm")
	public String GiftTestForm() {
		return "/bit/present/presentForm";
	}
	
	@GetMapping("/receivelist")
	@ResponseBody
	public List<OrderDto> getReceiverData(int num) {

		return giftservice.getReceiveSearch(num);
	}

	@GetMapping("/sendlist")
	@ResponseBody
	public List<OrderDto> getSenderData(int num) {
		
		return giftservice.getSendSearch(num);
	}
	
}
