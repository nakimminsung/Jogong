package bit.data.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import bit.data.dto.FaqDto;
import bit.data.service.CscenterServiceInter;

@Controller
@RequestMapping("/cscenter")
public class CscenterController {

	@Autowired
	CscenterServiceInter csService;
	
	@GetMapping("/faq")
	public String faq(Model model) {
			List<FaqDto> list=csService.getFaq();
			model.addAttribute("list",list);
		return "/bit/cscenter/faqform";
	}
	
	@GetMapping("/qnaform")
	   public String qnaform(Model model) {
	      
	      List<String> list=csService.selQnaCategory();
	      //System.out.println(list.size());
	      model.addAttribute("list",list);
	      
	      return "/bit/cscenter/qnaform";
	   }
	
}
