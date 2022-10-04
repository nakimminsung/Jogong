package bit.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.data.dao.UserDaoInter;
import bit.data.dto.UserDto;

@Service
public class UserService implements UserServiceInter {

	@Autowired
	UserDaoInter userDaoInter;
	
	@Override
	public List<UserDto> getUserFriendData(int userNum) {
		
		return userDaoInter.getUserFriendData(userNum);
	}

	@Override
	public int getUserFriendCount(int userNum) {
		return userDaoInter.getUserFriendCount(userNum);
	}
	@Override
	public void insertUser(UserDto dto) {
		// TODO Auto-generated method stub
		userDaoInter.insertUser(dto);
	}

	@Override
	public int getUserIdSearch(String email) {
		// TODO Auto-generated method stub
		return userDaoInter.getUserIdSearch(email);
	}
	@Override
	public int getIdPassCheck(String id, String pass) {
		// TODO Auto-generated method stub
		Map<String, String> map=new HashMap<String, String>();
		map.put("loginid", id);
		map.put("loginpass", pass);
		return userDaoInter.getIdPassCheck(map);
	}

	@Override
	public UserDto getDataById(String id) {
		// TODO Auto-generated method stub
		return userDaoInter.getDataById(id);
	}

}
