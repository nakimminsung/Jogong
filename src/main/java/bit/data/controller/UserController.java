package bit.data.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.SessionScope;

import bit.data.dto.ProductDto;
import bit.data.dto.QnaDto;
import bit.data.dto.UserDto;
import bit.data.service.UserService;
import bit.data.service.UserServiceInter;

@Controller
public class UserController {
	
	@Autowired
	UserServiceInter userServiceInter;
	
	@PostMapping("/user/friendData")
	@ResponseBody
	public List<UserDto> getUserFriendData(
	        @RequestBody HashMap<String,Object> param) {
	    
	    Map<String,Object> map = (HashMap<String, Object>) param.get("data");
	    
		return userServiceInter.getUserFriendData(map);
	}
	
	@GetMapping("/user/friendCount")
	@ResponseBody
	public int getUserFriendCount(int userNum) {
		return userServiceInter.getUserFriendCount(userNum);
	}
	
	@GetMapping("/mypage/cart")
	public String cartList() {
	    return "/mypage/mypage/cart";
	}
	

    @GetMapping("/mypage/user")
    public String userPage() {
        return "/mypage/mypage/user";
    }
    
    @GetMapping("/mypage/qna")
    public String qnaPage(Model model, HttpSession session) {
    	
    	int userNum=(int) session.getAttribute("loginUserNum");
		
		//userNum 을 보내서 qnaList 가져오기
		List<QnaDto> qnaList=userServiceInter.getQnaList(userNum);
		
//		System.out.println(qnaList);
		
		//model에 결과 담기
		model.addAttribute("qnaList",qnaList);
    	
        return "/mypage/mypage/qna";
    }
    
    
    @GetMapping("/user/review")
	@ResponseBody
	public List<UserDto> getReviewUserInfo(){
		
		return userServiceInter.getReviewUserInfo();
	}
	

}



