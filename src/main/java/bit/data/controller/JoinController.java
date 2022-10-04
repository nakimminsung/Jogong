package bit.data.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.data.dto.UserDto;
import bit.data.service.UserServiceInter;
import util.SHA256Util;


@Controller 
@RequestMapping("/join")
public class JoinController {
	
	@Autowired
	UserServiceInter userService;

	@GetMapping("/joinMain")
	public String joinMain() {
  
      return "/bit/join/joinMain";
   }

	@GetMapping("/sellerJoin")
	public String sellerJoin() {
  
      return "/bit/join/sellerJoin";
   }
	
	@GetMapping("/sellerJoinForm")
	public String sellerJoinForm(Model model) {
  
      return "/bit/join/sellerJoinForm";
   }

	
	@GetMapping("/userAgree")
	public String userJoin() {
  
	      return "/bit/join/userAgree";
	   }
	@GetMapping("/userSuccess")
	public String userJoins() {
  
	      return "/bit/join/userSuccess";
	   }
	
	@PostMapping("/insert")
	public String insert(HttpServletRequest request, UserDto dto) {
		String birthyear=request.getParameter("date").substring(0,4);
		String birthdate=request.getParameter("date").replace("-","").substring(4,8);
		String addressNum=request.getParameter("addressNum");
		String addressMain=request.getParameter("addressMain");
		String address=request.getParameter("address");
		
		address=addressNum+addressMain+address;
		
		String salt=SHA256Util.generateSalt();
		dto.setSalt(salt);
		
		//String salt = "Jb2*&B6PVx08>nG";
		
		String password=dto.getPassword();
		password=SHA256Util.getEncrypt(password, salt);
		dto.setPassword(password);
		
		//자동입력
		dto.setProfileImage("dd");
		dto.setAddress(address);
		dto.setPoint(0);
		dto.setYear(birthyear);
		dto.setDate(birthdate);
		dto.setLoginType("일반");
		dto.setAdmin(false);
		
		userService.insertUser(dto);
		
		return "/bit/join/userSuccess";
	}
	
	//아이디 중복체크
	@GetMapping("/idcheck")
	@ResponseBody
	public Map<String, Integer> getIdSearch(String email){
		Map<String, Integer> map =new HashMap<String, Integer>();
		int userCount=userService.getUserIdSearch(email);//
		//System.out.println(userCount);
		map.put("userCount", userCount);
		return map;
	}

	
}
