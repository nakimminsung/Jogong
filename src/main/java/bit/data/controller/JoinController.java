package bit.data.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;

import bit.data.dto.UserDto;
import bit.data.service.UserServiceInter;
import util.SHA256Util;
import bit.data.dto.SellerDto;
import bit.data.service.SellerServiceInter;



@Controller 
@RequestMapping("/join")
public class JoinController {
	

	//초기 세팅
	@Autowired
	SellerServiceInter sellerService;

	@Autowired
	UserServiceInter userService;


	//최초 회원가입 페이지
	@GetMapping("/joinMain")
	public String joinMain() {
  
      return "/bit/join/joinMain";
   }

	//판매자 회원가입 1단계 페이지로 이동 : 약관동의
	@GetMapping("/sellerJoin")
	public String sellerJoin() {
  
      return "/bit/join/sellerJoin";
   }
	//판매자 회원가입 2단계 페이지로 이동 : 정보입력	
	@GetMapping("/sellerJoinForm")
	public String sellerJoinForm() {
  
      return "/bit/join/sellerJoinForm";
   }


	//판매자 회원가입 3단계 페이지로 이동 : 가입완료 (seller insert 진행)
	@PostMapping("/sellerJoinComplete")
	public String sellerInsert(SellerDto dto, HttpServletRequest request) {
		
		//address 병합 (도로명 + 상세)
		String address="";
		String address1= request.getParameter("address1");
		String address2= request.getParameter("address2");
		
		
		//상세주소 유무에 따른 결과
		if(address2==null)
		{
			address=address1;
		}else {
			address=address1 +", "+ address2;
		}
		
		//SHA-256 암호화를 위한 salt 선언 및 dto에 담기
		String salt=SHA256Util.generateSalt();
		dto.setSalt(salt);
		
		//입력받은 password 가져오기
		String password=dto.getPassword();
		
		//password에 SHA-256 암호화 적용시키기 (원본, 랜덤 salt 값)
		password=SHA256Util.getEncrypt(password, salt);
		
		//암호화 적용된 비밀번호를 dto에 담기
		dto.setPassword(password);
		
		//dto에 담기
		dto.setAddress(address);
		dto.setLogoImage("https://github.com/kkookkss/jogong_data/blob/main/user/man/500user_default.png?raw=true");
		
		
		//ServiceInter 의 insertSeller 호출 (dto 전달)
		sellerService.insertSeller(dto);
		
		return "/bit/join/sellerJoinComplete";
   }
	
	

	// 성민
	
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
		dto.setProfileImage("https://github.com/kkookkss/jogong_data/blob/main/user/man/500user_default.png?raw=true");
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
	
	//카카오 회원가입&로그인
		@PostMapping("/userKakaoLogin")
		@ResponseBody
		public Map<String, String> userkakaologinprocess(String email, HttpSession session,UserDto dto){
			
			Map<String, String> map=new HashMap<String, String>();
			int userCount=userService.getUserIdSearch(email);  //seller,user 가입된 이메일 있으면 가입 안됨.
			if(userCount==0) {
			dto.setPhone("0");
			dto.setSalt("0");
			dto.setPassword("0");
			dto.setAddress("no");
			dto.setPoint(0);
			dto.setYear("0");
			dto.setLoginType("카카오");
			dto.setAdmin(false);
			
			userService.insertUser(dto);
			
			//유지 시간 설정
			session.setMaxInactiveInterval(60*60*4);//4시간
			//로그인한 아이디에 대한 정보를 얻어서 세션에 저장s
			UserDto userDto=userService.getDataById(email);
			session.setAttribute("loginok", "yes");
			session.setAttribute("loginid", email);
			session.setAttribute("loginname", userDto.getNickname());
			session.setAttribute("loginphoto", userDto.getProfileImage());
			
					
			}else{
				//유지 시간 설정
				session.setMaxInactiveInterval(60*60*4);//4시간
				//로그인한 아이디에 대한 정보를 얻어서 세션에 저장s
				UserDto userDto=userService.getDataById(email);
				session.setAttribute("loginok", "yes");
				session.setAttribute("loginid", email);
				session.setAttribute("loginname", userDto.getNickname());
				session.setAttribute("loginphoto", userDto.getProfileImage());
				
			}
			map.put("result",email!=null?"success":"fail");
			System.out.println(map);
			
			return map;
			
		}
		
		
		//네이버 회원가입&로그인
		@PostMapping("/userNaverLogin")
		@ResponseBody
		public Map<String, String> usernaverloginprocess(String email, HttpSession session, UserDto dto){
			
			Map<String, String> map=new HashMap<String, String>();
			int userCount=userService.getUserIdSearch(email);  //seller,user 가입된 이메일 있으면 가입 안됨.
			
			// 해당 email로 가입된 유저 정보가 없으면 DB insert로 진행
			if(userCount==0) {
			
				dto.setSalt("0");
				dto.setPoint(0);
				dto.setAdmin(false);
				dto.setLoginType("네이버");
			
				userService.insertUser(dto);
				
				//유지 시간 설정
				session.setMaxInactiveInterval(60*60*4);//4시간
		
				//로그인한 아이디에 대한 정보를 얻어서 세션에 저장
				UserDto userDto=userService.getDataById(email);
				
				session.setAttribute("loginok", "yes");
				session.setAttribute("loginid", email);
				session.setAttribute("loginname", userDto.getNickname());
				session.setAttribute("loginphoto", userDto.getProfileImage());
				
				//qna insert 테스트
				session.setAttribute("loginUserNum", userDto.getNum());
			
			}else{ // email 정보가 없다면 로그인으로
				
				//유지 시간 설정
				session.setMaxInactiveInterval(60*60*4);//4시간
				
				//로그인한 아이디에 대한 정보를 얻어서 세션에 저장s
				UserDto userDto=userService.getDataById(email);
				session.setAttribute("loginok", "yes");
				session.setAttribute("loginid", email);
				session.setAttribute("loginname", userDto.getNickname());
				session.setAttribute("loginphoto", userDto.getProfileImage());
				
				//qna insert 테스트 (네이버 계정 userNum 가져오는것 확인 완료)
				session.setAttribute("loginUserNum", userDto.getNum());
				
			}
			map.put("result",email!=null?"success":"fail");
			System.out.println(map);
			
			return map;
		}

}
