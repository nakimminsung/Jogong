package bit.data.service;

import java.util.List;

import bit.data.dto.UserDto;

public interface UserServiceInter {
	public List<UserDto> getUserFriendData(int userNum);
	public int getUserFriendCount(int userNum);
	public void insertUser(UserDto dto);
	public int getUserIdSearch(String email);
	public int getIdPassCheck(String id,String pass);
	public UserDto getDataById(String id);
}
