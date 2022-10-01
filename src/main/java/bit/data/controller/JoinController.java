package bit.data.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import bit.data.dto.UserDto;
import bit.data.service.JoinServiceInter;


@Controller 
@RequestMapping("/join")
public class JoinController {
	
	@Autowired
	JoinServiceInter joinService;

	@GetMapping("/joinMain")
	public String joinMain() {
  
	      return "/bit/join/joinMain";
	   }
	
	@GetMapping("/sellerJoin")
	public String sellerJoin() {
  
	      return "/bit/join/sellerJoin";
	   }
	
	@GetMapping("/userAgree")
	public String userJoin() {
  
	      return "/bit/join/userAgree";
	   }
	
	@PostMapping("/insert")
	public String insert(HttpServletRequest request, UserDto dto) {
		String birthyear=request.getParameter("date").substring(0,4);
		String birthdate=request.getParameter("date").replace("-","").substring(4,8);
		String addressNum=request.getParameter("addressNum");
		String addressMain=request.getParameter("addressMain");
		String address=request.getParameter("address");
		
		address=addressNum+addressMain+address;
		
		
		//자동입력
		dto.setProfileImage("dd");
		dto.setAddress(address);
		dto.setPoint(0);
		dto.setYear(birthyear);
		dto.setDate(birthdate);
		dto.setLoginType("일반");
		dto.setAdmin(false);
		
		joinService.insertUser(dto);
		
		return "/bit/join/sellerJoin"; //  /member/list 매핑주소 호출-컨트롤러메서드 호출
	}
}
