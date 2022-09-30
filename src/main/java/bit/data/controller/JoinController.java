package bit.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/join")
public class JoinController {

	@GetMapping("/joinMain")
	public String joinMain() {
  
      return "/bit/join/joinMain";
   }

	@GetMapping("/sellerJoin")
	public String sellerJoin(Model model) {
  
      return "/bit/join/sellerJoin";
   }
	
	@GetMapping("/sellerJoinForm")
	public String sellerJoinForm(Model model) {
  
      return "/bit/join/sellerJoinForm";
   }
	
}
