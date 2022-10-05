package bit.data.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.data.dto.SellerDto;
import bit.data.service.SellerServiceInter;
import bit.data.service.UserServiceInter;

import bit.data.dto.UserDto;
import util.SHA256Util;

@Controller

public class LoginController {

	//초기 세팅
	@Autowired
	UserServiceInter userService;
	
	@Autowired
	SellerServiceInter sellerService;
	
	
	
	//최초 로그인 페이지
	@GetMapping("/loginForm")
	public String loginForm(Model model,HttpSession session) {
		model.addAttribute("rememberId",session.getAttribute("rememberId"));
		model.addAttribute("savedId",session.getAttribute("loginid"));
		
		model.addAttribute("rememberSellerId",session.getAttribute("rememberSellerId"));
		model.addAttribute("savedSellerId",session.getAttribute("loginid_seller"));	//변경
		
      return "/bit/login/loginForm";
	}
	

	//seller 회원 로그인
	@PostMapping("/sellerLogin")
	@ResponseBody
	public Map<String, String> sellerloginprocess(String email,String password,HttpSession session,String rememberSellerId)
	{		
	
		Map<String, String> map=new HashMap<String, String>();
		
		//Dto 값 사용을 위해 email(id)값에 대한 seller정보 가져오기
		SellerDto sellerDto=sellerService.getDataSeller(email);
		
		String salt=sellerDto.getSalt();
		
		int result=0;
		
		//salt값이 없는 기존 seller의 경우
		if(salt==null) {
			result=sellerService.loginIdPassCheck(email, password);
			
		//salt가 있는 seller의 경우
		}else {
			//해당 salt를 적용하여 암호화하고 
			String user_pw = SHA256Util.getEncrypt(password, salt);
			
			//암호화 된 비밀번호로 로그인체크
			result=sellerService.loginIdPassCheck(email, user_pw);
		}
		
		
		if(result==1)	//id와 pass가 모두 맞는경우 (로그인상태)
		{
			//로그인 세션 유지 시간 설정
			session.setMaxInactiveInterval(60*60*6);	//1분-> 1시간 -> 6시간
			
			//로그인한 아이디에 대한 정보를 얻어서 세션에 저장			
			session.setAttribute("loginok", "yes");
			session.setAttribute("loginid_seller", email);	//변경
			session.setAttribute("loginname", sellerDto.getCompanyName());
			session.setAttribute("loginphoto", sellerDto.getLogoImage());
			
			session.setAttribute("rememberSellerId", rememberSellerId.equals("false")?"no":"yes");


		}
		map.put("result", result==1?"success":"fail");
		
		return map;
	}
	 
	
	@GetMapping("/logout")
	public String logout(HttpSession session)
	{
		//로그아웃 시 제거되어야 할 세션
		session.removeAttribute("loginok");	//이걸로 비교할거라서 얘만 지우면되지만, id까지 지우기로함
		//session.removeAttribute("loginid");
		
		return "redirect:/";
	}


	
	@PostMapping("/userLogin")
	@ResponseBody
	public Map<String, String> userloginprocess(String email,String password,HttpSession session,String rememberId)
	{
		Map<String, String> map=new HashMap<String, String>();
		UserDto dto = userService.getDataById(email);
		String salt=dto.getSalt();
		int result=0;
		if(salt==null) {
			 result=userService.getIdPassCheck(email, password);
		}else {
			String user_pw = SHA256Util.getEncrypt(password, salt);
			 result=userService.getIdPassCheck(email, user_pw);
			 
		}
				
		if(result==1)//아이디와 패스가 모두 맞는 경우 
		{
			//유지 시간 설정
			session.setMaxInactiveInterval(60*60*4);//4시간
			//로그인한 아이디에 대한 정보를 얻어서 세션에 저장s
			UserDto userDto=userService.getDataById(email);
			session.setAttribute("loginok", "yes");
			session.setAttribute("loginid", email);
			session.setAttribute("rememberId", rememberId.equals("false")?"no":"yes");
			session.setAttribute("loginname", userDto.getNickname());
			session.setAttribute("loginphoto", userDto.getProfileImage());
			
		}
		map.put("result", result==1?"success":"fail");
		return map;
		
	}
	
//	카카오 로그인
	@GetMapping("/loginForm/kakaoLogin")
	public String kakaoLogin() {

		
      return "/bit/login/kakaoLogin";
	}

//성민 카카오 로그인
	@PostMapping("/userKakaoLogin")
	@ResponseBody
	public Map<String, String> userkakaologinprocess(String email, HttpSession session)
	{
		
		Map<String, String> map=new HashMap<String, String>();
				
		if(email!=null)//카카오로부터 이메일 가져오는 경우
		{
			//유지 시간 설정
			session.setMaxInactiveInterval(60*60*4);//4시간
			//로그인한 아이디에 대한 정보를 얻어서 세션에 저장s
			UserDto userDto=userService.getDataById(email);
			session.setAttribute("loginok", "yes");
			session.setAttribute("loginid", email);
			session.setAttribute("loginname", userDto.getNickname());
			session.setAttribute("loginphoto", userDto.getProfileImage());
			
		}
		map.put("result","success");
		
		return map;
		
	}
	
}
