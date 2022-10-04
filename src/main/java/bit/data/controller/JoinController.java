package bit.data.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import bit.data.dto.SellerDto;
import bit.data.service.SellerServiceInter;
import util.SHA256Util;


@Controller
@RequestMapping("/join")
public class JoinController {
	
	//초기 세팅
	@Autowired
	SellerServiceInter sellerService;

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
		
		//SHA256 암호화를 위한 salt Key값
		String salt = "Jb2*&B6PVx08>nG";
		String password=dto.getPassword();
		password=SHA256Util.getEncrypt(password, salt);
		dto.setPassword(password);
		
		//상세주소 유무에 따른 결과
		if(address2==null)
		{
			address=address1;
		}else {
			address=address1 +", "+ address2;
		}
		
		dto.setAddress(address);
		dto.setLogoImage("user_default.png");

		//중간 확인 (콘솔)
		System.out.println(dto.getEmail());
		System.out.println(dto.getPassword());
		System.out.println(dto.getCompanyName());
		System.out.println(dto.getBusinessNumber());
		System.out.println(dto.getLogoImage());	//null
		System.out.println(dto.getPhone());
		System.out.println(dto.getAddress());
		System.out.println(dto.getBank());
		System.out.println(dto.getAccountNumber());
		
		//ServiceInter 의 insertSeller 호출 (dto 전달)
		sellerService.insertSeller(dto);
		
		return "/bit/join/sellerJoinComplete";
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
