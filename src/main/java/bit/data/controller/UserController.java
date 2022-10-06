package bit.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.data.dto.UserDto;
import bit.data.service.UserServiceInter;

@Controller
public class UserController {
	
	@Autowired
	UserServiceInter userServiceInter;
	
	@GetMapping("/user/friendData")
	@ResponseBody
	public List<UserDto> getUserFriendData(int userNum) {
		return userServiceInter.getUserFriendData(userNum);
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
    public String qnaPage() {
        return "/mypage/mypage/qna";
    }
}



