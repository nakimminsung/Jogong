package bit.data.controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import bit.data.dto.FaqCategoryDto;
import bit.data.dto.FaqDto;
import bit.data.dto.NoticeDto;
import bit.data.service.CscenterServiceInter;

@Controller
@RequestMapping("/cscenter")
public class CscenterController {

	@Autowired
	CscenterServiceInter csService;
	
	@GetMapping("/faq")
	public String faq(Model model,HttpServletRequest request) {
			String num= request.getParameter("num");
			if(num==null) {
				num = "1";
			}
			List<FaqDto> list1=csService.getFaqByNum(Integer.parseInt(num));
			List<FaqCategoryDto> list2=csService.selFaqCategory(Integer.parseInt(num));
			model.addAttribute("list",list1);
			model.addAttribute("list1",list2);
	
		return "/bit/cscenter/faqform";
	}
	
	@GetMapping("/qnaform")
	   public String qnaform(Model model) {
	      
	      List<String> list=csService.selQnaCategory();
	      //System.out.println(list.size());
	      model.addAttribute("list",list);
	      
	      return "/bit/cscenter/qnaform";
	   }
	@GetMapping("/faq/search")
	public String faqsearch(Model model,HttpServletRequest request) {
			String searchword= request.getParameter("searchword");
			List<FaqDto> list3=csService.getSearchFaq(searchword);
			int totalcount=csService.getTcFaq(searchword);
			model.addAttribute("list3",list3);
			model.addAttribute("totalcount", totalcount);
			model.addAttribute("searchword", searchword);

		return "/bit/cscenter/faqsearch";
	}
	
}
