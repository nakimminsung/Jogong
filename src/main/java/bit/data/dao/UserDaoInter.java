package bit.data.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bit.data.dto.UserDto;

public interface UserDaoInter {
	public List<UserDto> getUserFriendData(int userNum);
	public int getUserFriendCount(int userNum);
	public void insertUser(UserDto dto);
	public int getUserIdSearch(String email);
	public int getIdPassCheck(Map<String, String> map);
	public UserDto getDataById(String email);
	
<<<<<<< HEAD
	//카카오
	public void insertKakao(UserDto dto);
=======
>>>>>>> c2c606ad63de8951d0d43dc61529dd633cbe7ff7
}
