package bit.data.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


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
	
//	//아이디 체크하는 메서드 -> json 으로 반환
//	@GetMapping("/idcheck")	//원래는 /member/idcheck
//	@ResponseBody	//json 반환 //일반 컨트롤러이기때문
//	public Map<String, Integer> getSearchId(String id)
//	{
//		Map<String, Integer> map=new HashMap<String, Integer>();
//		int count=memService.getSearchId(id);	//id가 있을 경우 1, 없을 경우 0반환
//		map.put("count", count);	//"count" 라는 값으로 보내겠다 (0또는 1)
//		
//		return map;
//	}
	
}
