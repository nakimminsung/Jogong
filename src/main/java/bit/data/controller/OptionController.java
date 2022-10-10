package bit.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import bit.data.dto.OptionDto;
import bit.data.service.OptionServiceInter;

@Controller
@RequestMapping("/option")
public class OptionController {
	@Autowired
	OptionServiceInter optionService;
	 
	@GetMapping("/list")
	public List<OptionDto> getAllOption(int productNum)
	{
		return optionService.getAllOption(productNum);
	}
}
