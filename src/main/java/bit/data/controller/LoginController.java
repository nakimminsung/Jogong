package bit.data.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.data.dto.SellerDto;
import bit.data.service.SellerServiceInter;
import bit.data.service.UserServiceInter;

@Controller
@RequestMapping("/login")
public class LoginController {

	//초기 세팅
	UserServiceInter userService;
	SellerServiceInter sellerService;
	
	
	//최초 로그인 페이지
	@GetMapping("/loginForm")
	public String loginForm() {
  
      return "/bit/login/loginForm";
	}
	

	//seller 회원 로그인
	@PostMapping("/sellerLogin")
	@ResponseBody
	public Map<String, String> loginprocess(String sellerEmail,String sellerPassword,HttpSession session)
	{
		Map<String, String> map=new HashMap<String, String>();
		
		int result=sellerService.loginIdPassCheck(sellerEmail, sellerPassword);
		
		if(result==1)	//id와 pass가 모두 맞는경우 (로그인상태)
		{
			//로그인 세션 유지 시간 설정
			session.setMaxInactiveInterval(60*60*6);	//1분-> 1시간 -> 6시간
			
			//로그인한 아이디에 대한 정보를 얻어서 세션에 저장
			SellerDto sellerDto=sellerService.getDataSeller(sellerEmail);
			session.setAttribute("loginok", "yes");
			session.setAttribute("loginid", sellerEmail);
			session.setAttribute("loginname", sellerDto.getCompanyName());
//			session.setAttribute("loginphoto", sellerDto.getPhoto());
		}
		map.put("result", result==1?"success":"fail");
		
		return map;
	}
	 
	
	@GetMapping("/logout")
	@ResponseBody
	public void logout(HttpSession session)
	{
		//로그아웃 시 제거되어야 할 세션
		session.removeAttribute("loginok");	//이걸로 비교할거라서 얘만 지우면되지만, id까지 지우기로함
		session.removeAttribute("loginid");
	}
}
