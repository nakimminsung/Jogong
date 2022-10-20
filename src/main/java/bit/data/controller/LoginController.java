package bit.data.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
	
	@Autowired
	private JavaMailSender mailSender;
	
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
			//sellerNum 보류


		}
		map.put("result", result==1?"success":"fail");
		
		return map;
	}
	 
	
	@GetMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response)
	{
		//로그아웃 시 제거되어야 할 세션
		session.removeAttribute("loginok");	
		session.removeAttribute("loginUserNum");
		session.removeAttribute("loginname");
		session.removeAttribute("loginphoto");
		session.removeAttribute("loginType");
		
		
		
		//session.invalidate();
		//로그인폼에서 ID저장이 세션으로 저장되고있어서 전체 지우는건 안하기로

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
			//로그인한 아이디에 대한 정보를 얻어서 세션에 저장
			UserDto userDto=userService.getDataById(email);
			session.setAttribute("loginok", "yes");
			session.setAttribute("loginid", email);
			session.setAttribute("rememberId", rememberId.equals("false")?"no":"yes");
			session.setAttribute("loginname", userDto.getNickname());
			session.setAttribute("loginphoto", userDto.getProfileImage());
			
			session.setAttribute("loginUserNum", userDto.getNum());
			session.setAttribute("loginType", userDto.getLoginType());
			session.setAttribute("loginBirth", userDto.getDate());
			
		}
		map.put("result", result==1?"success":"fail");
		return map;
		
	}
	
	//카카오 회원가입&로그인
	@PostMapping("/userKakaoLogin")
	@ResponseBody
	public Map<String, String> userkakaologinprocess(String email, HttpSession session,UserDto dto){
		
		Map<String, String> map=new HashMap<String, String>();
		int userCount=userService.getUserIdSearch(email);  //seller,user 가입된 이메일 있으면 가입 안됨.
		if(userCount==0) {
		dto.setSalt("0");
		dto.setPoint(0);
		
		dto.setLoginType("카카오");
		dto.setAdmin(false);
		
		userService.insertUser(dto);
		
		//유지 시간 설정
		session.setMaxInactiveInterval(60*60*4);//4시간
		//로그인한 아이디에 대한 정보를 얻어서 세션에 저장
		UserDto userDto=userService.getDataById(email);
		session.setAttribute("loginok", "yes");
		session.setAttribute("loginid", email);
		session.setAttribute("loginname", userDto.getNickname());
		session.setAttribute("loginphoto", userDto.getProfileImage());
		
		session.setAttribute("loginUserNum", userDto.getNum());
		session.setAttribute("loginType", userDto.getLoginType());
		session.setAttribute("loginBirth", userDto.getDate());
		
				
		}else{
			//유지 시간 설정
			session.setMaxInactiveInterval(60*60*4);//4�떆媛�
			//로그인한 아이디에 대한 정보를 얻어서 세션에 저장
			UserDto userDto=userService.getDataById(email);
			session.setAttribute("loginok", "yes");
			session.setAttribute("loginid", email);
			session.setAttribute("loginname", userDto.getNickname());
			session.setAttribute("loginphoto", userDto.getProfileImage());
			
			session.setAttribute("loginUserNum", userDto.getNum());
			session.setAttribute("loginType", userDto.getLoginType());
			session.setAttribute("loginBirth", userDto.getDate());
		}
		map.put("result",email!=null?"success":"fail");
		
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
			session.setAttribute("loginType", userDto.getLoginType());
			session.setAttribute("loginBirth", userDto.getDate());
		
		}else{ // email 정보가 없다면 로그인으로
			
			//유지 시간 설정
			session.setMaxInactiveInterval(60*60*4);//4시간
			
			//로그인한 아이디에 대한 정보를 얻어서 세션에 저장
			UserDto userDto=userService.getDataById(email);
			session.setAttribute("loginok", "yes");
			session.setAttribute("loginid", email);
			session.setAttribute("loginname", userDto.getNickname());
			session.setAttribute("loginphoto", userDto.getProfileImage());
			
			//qna insert 테스트 (네이버 계정 userNum 가져오는것 확인 완료)
			session.setAttribute("loginUserNum", userDto.getNum());
			session.setAttribute("loginType", userDto.getLoginType());
			session.setAttribute("loginBirth", userDto.getDate());
			
		}
		map.put("result",email!=null?"success":"fail");
		
		return map;
	}
	//회원정보 수정 전 비밀번호 확인
	@PostMapping("/mypage/passwordCheck")
	@ResponseBody
	public Map<String, String> userloginprocess(String email,String password,HttpSession session)
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
				
		map.put("result", result==1?"success":"fail");
		return map;
		
	}
	//일반 유저 개인정보 수정
	@PostMapping("/mypage/update")
	public String updateUser(UserDto dto,HttpSession session,HttpServletRequest request, MultipartFile upload) {	

		//업로드 경로 + 경로 확인
	    String path = request.getSession().getServletContext().getRealPath("/resources/upload");
	    System.out.println("upload path : " + path);
	      
	    //원본 파일 명 + 확인
	    String originFileName = upload.getOriginalFilename();
	    //System.out.println("originFileName : " + originFileName);
	    
	    try {
	    	  upload.transferTo(new File(path + "/" +originFileName));
	      } catch (IllegalStateException e) {
	    	  // TODO Auto-generated catch block
	    	  e.printStackTrace();
	      } catch (IOException e) {
	    	  // TODO Auto-generated catch block
	    	  e.printStackTrace();
	      }

		String salt=SHA256Util.generateSalt();
		String password=dto.getPassword();
		password=SHA256Util.getEncrypt(password, salt);
		String addressNum=request.getParameter("addressNum");
		String addressMain=request.getParameter("addressMain");
		String address=request.getParameter("address");
		address=addressNum+addressMain+address;
		
		dto.setEmail((String) session.getAttribute("loginid"));
		dto.setSalt(salt);	
		dto.setPassword(password);
		dto.setAddress(address);	
		if(originFileName=="") {
			dto.setProfileImage((String) session.getAttribute("loginphoto"));
		}else {
			dto.setProfileImage("/jogong/resources/upload/"+originFileName);
		}
		
		
		userService.updateUser(dto);
		session.setAttribute("loginname", dto.getNickname());
		session.setAttribute("loginphoto",dto.getProfileImage());
		
		
		return "redirect:/";
	}
	
	//소셜유저 개인정보 수정
	@PostMapping("/mypage/updateSocialUser")
	public String updateSocialUser(UserDto dto,HttpSession session,HttpServletRequest request, MultipartFile upload) {	
	
		//업로드 경로 + 경로 확인
		String path = request.getSession().getServletContext().getRealPath("/resources/upload");
		//System.out.println("upload path : " + path);
	      
		// �썝蹂� �뙆�씪 紐� + �솗�씤
		String originFileName = upload.getOriginalFilename();
		//System.out.println("originFileName : " + originFileName);

		try {
			upload.transferTo(new File(path + "/" +originFileName));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	        
		dto.setEmail((String) session.getAttribute("loginid"));
		if(originFileName=="") {
			dto.setProfileImage((String) session.getAttribute("loginphoto"));
		}else {
			dto.setProfileImage("/jogong/resources/upload/"+originFileName);
		}
		userService.updateUser(dto);
		session.setAttribute("loginname", dto.getNickname());
		session.setAttribute("loginphoto",dto.getProfileImage());
		
		
		return "redirect:/";
	}
	
	//아이디 찾기 페이지 이동
	@GetMapping("/loginForm/searchId")
	public String searchId() {
		
		return "/bit/loginPopup/searchId";
	}
	
	
	//아이디 찾기 ajax
	@PostMapping("/loginForm/checkId")
	@ResponseBody
	public Map<String, String> checkId(String nickname,String phone,Model model) {
		Map<String, String> map=new HashMap<String, String>();
		String email=userService.searchId(nickname, phone);
		map.put("emailCheck", email==null?"fail":"success");
		map.put("email", email);
		return map;
	}
	


	//비번찾기 후 비번수정
	@GetMapping("/searchPass2")
	public String updateUserPass(String email, String password, HttpServletRequest request, HttpSession session) {

		
		//입력받은 비밀번호 가져오기
		password=request.getParameter("password");
		
		//salt 설정해주기
		String salt=SHA256Util.generateSalt();
		
		//비밀번호 암호화 (salt 적용)
		password=SHA256Util.getEncrypt(password, salt);

		UserDto dto=new UserDto();
		
		//dto에 담기
		dto.setEmail(email);
		dto.setSalt(salt);
		dto.setPassword(password);
		
		System.out.println(dto);
		
		//dto 정보를 보내기(비번수정)
		userService.updateUserPass(dto);
				
		//완료 후 세션제거
		session.removeAttribute("email");
		
		//여기서는 의미없음 (정상적인 경로로만 써주면 됨)
		return "/bit/main/main";
		
	}

	

	//비밀번호 사이트 이동
	@GetMapping("/loginForm/searchPass")
	public String searchPass() {
		
		return "/bit/loginPopup/searchPass";
		
	}
	
	
	@PostMapping("/loginForm/pw_auth.me")
	public ModelAndView pw_auth(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String email = (String)request.getParameter("email");
		String nickname = (String)request.getParameter("nickname");
		
		UserDto vo = userService.searchPass(nickname, email);
			
			if( vo != null && vo.getLoginType().equals("일반")) {
				Random r = new Random();
				int num = r.nextInt(999999); // 랜덤난수설정
		
					if (vo.getNickname().equals(nickname)) {
						session.setAttribute("email", vo.getEmail());

						String setfrom = "sungmin9844@naver.com"; 
						String tomail = email; //받는사람
						String title = "[조공] 비밀번호변경 인증 이메일 입니다"; 
						String content = System.getProperty("line.separator") + "안녕하세요" + System.getProperty("line.separator")
						+ "조공 비밀번호찾기(변경) 인증번호는 " + num + " 입니다." + System.getProperty("line.separator"); // 

						try {
							MimeMessage message = mailSender.createMimeMessage();
							MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");

							messageHelper.setFrom(setfrom); 
							messageHelper.setTo(tomail); 
							messageHelper.setSubject(title);
							messageHelper.setText(content); 

							mailSender.send(message);
						} catch (Exception e) {
							System.out.println(e.getMessage());
						}

						ModelAndView mv = new ModelAndView();
						mv.setViewName("/loginPopup/checkNum");
						mv.addObject("num", num);
			
						return mv;
					}else {
						ModelAndView mv = new ModelAndView();
						mv.setViewName("/alert/alert");
						mv.addObject("msg1", "아이디 또는 이름이 잘못되었습니다.");
						mv.addObject("msg2", "소셜로그인의 경우 해당 소셜에서 비밀번호 변경해야합니다.");
						mv.addObject("url", "/jogong/loginForm/searchPass");
						return mv;
						
					}
			}else {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("/alert/alert");
			mv.addObject("msg1", "아이디 또는 이름이 잘못되었습니다.");
			mv.addObject("msg2", "소셜로그인의 경우 해당 소셜에서 비밀번호 변경해야합니다.");
			mv.addObject("url", "/jogong/loginForm/searchPass");
			return mv;
		
		}
	}
	

}
