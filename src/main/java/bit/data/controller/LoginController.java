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

	//珥덇린 �꽭�똿
	@Autowired
	UserServiceInter userService;
	
	@Autowired
	SellerServiceInter sellerService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	//理쒖큹 濡쒓렇�씤 �럹�씠吏�
	@GetMapping("/loginForm")
	public String loginForm(Model model,HttpSession session) {
		model.addAttribute("rememberId",session.getAttribute("rememberId"));
		model.addAttribute("savedId",session.getAttribute("loginid"));
		
		model.addAttribute("rememberSellerId",session.getAttribute("rememberSellerId"));
		model.addAttribute("savedSellerId",session.getAttribute("loginid_seller"));	//蹂�寃�
		
      return "/bit/login/loginForm";
	}
	

	//seller �쉶�썝 濡쒓렇�씤
	@PostMapping("/sellerLogin")
	@ResponseBody
	public Map<String, String> sellerloginprocess(String email,String password,HttpSession session,String rememberSellerId)
	{		
	
		Map<String, String> map=new HashMap<String, String>();
		
		//Dto 媛� �궗�슜�쓣 �쐞�빐 email(id)媛믪뿉 ���븳 seller�젙蹂� 媛��졇�삤湲�
		SellerDto sellerDto=sellerService.getDataSeller(email);
		
		String salt=sellerDto.getSalt();
		
		int result=0;
		
		//salt媛믪씠 �뾾�뒗 湲곗〈 seller�쓽 寃쎌슦
		if(salt==null) {
			result=sellerService.loginIdPassCheck(email, password);
			
		//salt媛� �엳�뒗 seller�쓽 寃쎌슦
		}else {
			//�빐�떦 salt瑜� �쟻�슜�븯�뿬 �븫�샇�솕�븯怨� 
			String user_pw = SHA256Util.getEncrypt(password, salt);
			
			//�븫�샇�솕 �맂 鍮꾨�踰덊샇濡� 濡쒓렇�씤泥댄겕
			result=sellerService.loginIdPassCheck(email, user_pw);
		}
		
		
		if(result==1)	//id�� pass媛� 紐⑤몢 留욌뒗寃쎌슦 (濡쒓렇�씤�긽�깭)
		{
			//濡쒓렇�씤 �꽭�뀡 �쑀吏� �떆媛� �꽕�젙
			session.setMaxInactiveInterval(60*60*6);	//1遺�-> 1�떆媛� -> 6�떆媛�
			
			//濡쒓렇�씤�븳 �븘�씠�뵒�뿉 ���븳 �젙蹂대�� �뼸�뼱�꽌 �꽭�뀡�뿉 ���옣			
			session.setAttribute("loginok", "yes");
			session.setAttribute("loginid_seller", email);	//蹂�寃�
			session.setAttribute("loginname", sellerDto.getCompanyName());
			session.setAttribute("loginphoto", sellerDto.getLogoImage());
			
			session.setAttribute("rememberSellerId", rememberSellerId.equals("false")?"no":"yes");			
			//sellerNum  蹂대쪟


		}
		map.put("result", result==1?"success":"fail");
		
		return map;
	}
	 
	
	@GetMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response)
	{
		//濡쒓렇�븘�썐 �떆 �젣嫄곕릺�뼱�빞 �븷 �꽭�뀡
		session.removeAttribute("loginok");	
		session.removeAttribute("loginUserNum");
		session.removeAttribute("loginname");
		session.removeAttribute("loginphoto");
		session.removeAttribute("loginType");
		
		
		
		//session.invalidate();
		//濡쒓렇�씤�뤌�뿉�꽌 ID���옣�씠 �꽭�뀡�쑝濡� ���옣�릺怨좎엳�뼱�꽌 �쟾泥� 吏��슦�뒗嫄� �븞�븯湲곕줈

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
				
		if(result==1)//�븘�씠�뵒�� �뙣�뒪媛� 紐⑤몢 留욌뒗 寃쎌슦 
		{
			//�쑀吏� �떆媛� �꽕�젙
			session.setMaxInactiveInterval(60*60*4);//4�떆媛�
			//濡쒓렇�씤�븳 �븘�씠�뵒�뿉 ���븳 �젙蹂대�� �뼸�뼱�꽌 �꽭�뀡�뿉 ���옣
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
	
	//移댁뭅�삤 �쉶�썝媛��엯&濡쒓렇�씤
	@PostMapping("/userKakaoLogin")
	@ResponseBody
	public Map<String, String> userkakaologinprocess(String email, HttpSession session,UserDto dto){
		
		Map<String, String> map=new HashMap<String, String>();
		int userCount=userService.getUserIdSearch(email);  //seller,user 媛��엯�맂 �씠硫붿씪 �엳�쑝硫� 媛��엯 �븞�맖.
		if(userCount==0) {
		dto.setSalt("0");
		dto.setPoint(0);
		
		dto.setLoginType("移댁뭅�삤");
		dto.setAdmin(false);
		
		userService.insertUser(dto);
		
		//�쑀吏� �떆媛� �꽕�젙
		session.setMaxInactiveInterval(60*60*4);//4�떆媛�
		//濡쒓렇�씤�븳 �븘�씠�뵒�뿉 ���븳 �젙蹂대�� �뼸�뼱�꽌 �꽭�뀡�뿉 ���옣s
		UserDto userDto=userService.getDataById(email);
		session.setAttribute("loginok", "yes");
		session.setAttribute("loginid", email);
		session.setAttribute("loginname", userDto.getNickname());
		session.setAttribute("loginphoto", userDto.getProfileImage());
		
		session.setAttribute("loginUserNum", userDto.getNum());
		session.setAttribute("loginType", userDto.getLoginType());
		session.setAttribute("loginBirth", userDto.getDate());
		
				
		}else{
			//�쑀吏� �떆媛� �꽕�젙
			session.setMaxInactiveInterval(60*60*4);//4�떆媛�
			//濡쒓렇�씤�븳 �븘�씠�뵒�뿉 ���븳 �젙蹂대�� �뼸�뼱�꽌 �꽭�뀡�뿉 ���옣s
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
	
	//�꽕�씠踰� �쉶�썝媛��엯&濡쒓렇�씤
	@PostMapping("/userNaverLogin")
	@ResponseBody
	public Map<String, String> usernaverloginprocess(String email, HttpSession session, UserDto dto){
		
		Map<String, String> map=new HashMap<String, String>();
		int userCount=userService.getUserIdSearch(email);  //seller,user 媛��엯�맂 �씠硫붿씪 �엳�쑝硫� 媛��엯 �븞�맖.
		
		// �빐�떦 email濡� 媛��엯�맂 �쑀�� �젙蹂닿� �뾾�쑝硫� DB insert濡� 吏꾪뻾
		if(userCount==0) {
		
			dto.setSalt("0");
			dto.setPoint(0);
			dto.setAdmin(false);
			dto.setLoginType("�꽕�씠踰�");
		
			userService.insertUser(dto);
			
			//�쑀吏� �떆媛� �꽕�젙
			session.setMaxInactiveInterval(60*60*4);//4�떆媛�
	
			//濡쒓렇�씤�븳 �븘�씠�뵒�뿉 ���븳 �젙蹂대�� �뼸�뼱�꽌 �꽭�뀡�뿉 ���옣
			UserDto userDto=userService.getDataById(email);
			
			session.setAttribute("loginok", "yes");
			session.setAttribute("loginid", email);
			session.setAttribute("loginname", userDto.getNickname());
			session.setAttribute("loginphoto", userDto.getProfileImage());
			
			//qna insert �뀒�뒪�듃
			session.setAttribute("loginUserNum", userDto.getNum());
			session.setAttribute("loginType", userDto.getLoginType());
			session.setAttribute("loginBirth", userDto.getDate());
		
		}else{ // email �젙蹂닿� �뾾�떎硫� 濡쒓렇�씤�쑝濡�
			
			//�쑀吏� �떆媛� �꽕�젙
			session.setMaxInactiveInterval(60*60*4);//4�떆媛�
			
			//濡쒓렇�씤�븳 �븘�씠�뵒�뿉 ���븳 �젙蹂대�� �뼸�뼱�꽌 �꽭�뀡�뿉 ���옣s
			UserDto userDto=userService.getDataById(email);
			session.setAttribute("loginok", "yes");
			session.setAttribute("loginid", email);
			session.setAttribute("loginname", userDto.getNickname());
			session.setAttribute("loginphoto", userDto.getProfileImage());
			
			//qna insert �뀒�뒪�듃 (�꽕�씠踰� 怨꾩젙 userNum 媛��졇�삤�뒗寃� �솗�씤 �셿猷�)
			session.setAttribute("loginUserNum", userDto.getNum());
			session.setAttribute("loginType", userDto.getLoginType());
			session.setAttribute("loginBirth", userDto.getDate());
			
		}
		map.put("result",email!=null?"success":"fail");
		
		return map;
	}
	//�쉶�썝�젙蹂� �닔�젙 �쟾 鍮꾨�踰덊샇 �솗�씤
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
	//�씪諛� �쑀�� 媛쒖씤�젙蹂� �닔�젙
	@PostMapping("/mypage/update")
	public String updateUser(UserDto dto,HttpSession session,HttpServletRequest request, MultipartFile upload) {	
		
		// �뾽濡쒕뱶 寃쎈줈 + 寃쎈줈 �솗�씤
	      String path = request.getSession().getServletContext().getRealPath("/resources/upload");
	      System.out.println("upload path : " + path);
	      
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
	
	//�냼�뀥�쑀�� 媛쒖씤�젙蹂� �닔�젙
	@PostMapping("/mypage/updateSocialUser")
	public String updateSocialUser(UserDto dto,HttpSession session,HttpServletRequest request, MultipartFile upload) {	
	
		// �뾽濡쒕뱶 寃쎈줈 + 寃쎈줈 �솗�씤
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
	
	//�븘�씠�뵒 李얘린 �럹�씠吏� �씠�룞
	@GetMapping("/loginForm/searchId")
	public String searchId() {
		
		return "/bit/loginPopup/searchId";
	}
	
	
	//�븘�씠�뵒 李얘린 ajax
	@PostMapping("/loginForm/checkId")
	@ResponseBody
	public Map<String, String> checkId(String nickname,String phone,Model model) {
		Map<String, String> map=new HashMap<String, String>();
		String email=userService.searchId(nickname, phone);
		map.put("emailCheck", email==null?"fail":"success");
		map.put("email", email);
		return map;
	}
	


	//鍮꾨쾲李얘린 �썑 鍮꾨쾲�닔�젙
	@GetMapping("/searchPass2")
	public String updateUserPass(String email, String password, HttpServletRequest request, HttpSession session) {

		
		//�엯�젰諛쏆� 鍮꾨�踰덊샇 媛��졇�삤湲�
		password=request.getParameter("password");
		
		//salt �꽕�젙�빐二쇨린
		String salt=SHA256Util.generateSalt();
		
		//鍮꾨�踰덊샇 �븫�샇�솕 (salt �쟻�슜)
		password=SHA256Util.getEncrypt(password, salt);

		
		UserDto dto=new UserDto();
		
		//dto�뿉 �떞湲�
		dto.setEmail(email);
		dto.setSalt(salt);
		dto.setPassword(password);
		
		System.out.println(dto);
		
		//dto �젙蹂대�� 蹂대궡湲�(鍮꾨쾲�닔�젙)
		userService.updateUserPass(dto);
				
		//�셿猷� �썑 �꽭�뀡�젣嫄�
		session.removeAttribute("email");
		
		
		//�뿬湲곗꽌�뒗 �쓽誘몄뾾�쓬 (�젙�긽�쟻�씤 寃쎈줈濡쒕쭔 �뜥二쇰㈃ �맖)
		return "/bit/main/main";
		
	}

	

	//鍮꾨�踰덊샇 �궗�씠�듃 �씠�룞
	@GetMapping("/loginForm/searchPass")
	public String searchPass() {
		
		return "/bit/loginPopup/searchPass";
		
	}
	
	
	@PostMapping("/loginForm/pw_auth.me")
	public ModelAndView pw_auth(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String email = (String)request.getParameter("email");
		String nickname = (String)request.getParameter("nickname");
		
		UserDto vo = userService.searchPass(nickname, email);
			
			if( vo != null && vo.getLoginType().equals("�씪諛�")) {
				Random r = new Random();
				int num = r.nextInt(999999); // �옖�뜡�궃�닔�꽕�젙
		
					if (vo.getNickname().equals(nickname)) {
						session.setAttribute("email", vo.getEmail());

						String setfrom = "sungmin9844@naver.com"; 
						String tomail = email; //諛쏅뒗�궗�엺
						String title = "[議곌났] 鍮꾨�踰덊샇蹂�寃� �씤利� �씠硫붿씪 �엯�땲�떎"; 
						String content = System.getProperty("line.separator") + "�븞�뀞�븯�꽭�슂" + System.getProperty("line.separator")
						+ "議곌났 鍮꾨�踰덊샇李얘린(蹂�寃�) �씤利앸쾲�샇�뒗 " + num + " �엯�땲�떎." + System.getProperty("line.separator"); // 

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
						mv.addObject("msg1", "�븘�씠�뵒 �삉�뒗 �씠由꾩씠 �옒紐삳릺�뿀�뒿�땲�떎.");
						mv.addObject("msg2", "�냼�뀥濡쒓렇�씤�쓽 寃쎌슦 �빐�떦 �냼�뀥�뿉�꽌 鍮꾨�踰덊샇 蹂�寃쏀빐�빞�빀�땲�떎.");
						mv.addObject("url", "/jogong/loginForm/searchPass");
						return mv;
						
					}
			}else {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("/alert/alert");
			mv.addObject("msg1", "�븘�씠�뵒 �삉�뒗 �씠由꾩씠 �옒紐삳릺�뿀�뒿�땲�떎.");
			mv.addObject("msg2", "�냼�뀥濡쒓렇�씤�쓽 寃쎌슦 �빐�떦 �냼�뀥�뿉�꽌 鍮꾨�踰덊샇 蹂�寃쏀빐�빞�빀�땲�떎.");
			mv.addObject("url", "/jogong/loginForm/searchPass");
			return mv;
		
		}
	}
	

}
