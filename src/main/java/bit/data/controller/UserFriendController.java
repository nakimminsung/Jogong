package bit.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.data.dto.UserFriendDto;
import bit.data.service.UserFriendServiceInter;

@Controller
public class UserFriendController {
	
	
	@Autowired
	UserFriendServiceInter userFriendServiceInter;
	
	@GetMapping("/friend/list")
	@ResponseBody
	public List<UserFriendDto> list(int userNum) {
		
		return userFriendServiceInter.getFriendlist(userNum);
	}
}
