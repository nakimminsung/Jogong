package bit.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.data.dao.UserFriendDaoInter;
import bit.data.dto.UserFriendDto;

@Service
public class UserFriendService implements UserFriendServiceInter {

	@Autowired
	UserFriendDaoInter userFriendDaoInter;
	
	@Override
	public List<UserFriendDto> getFriendlist(int userNum) {
		
		return userFriendDaoInter.getFriendlist(userNum);
	}

}
