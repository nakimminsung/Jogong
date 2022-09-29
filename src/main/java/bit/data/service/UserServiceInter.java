package bit.data.service;

import java.util.List;

import bit.data.dto.UserDto;

public interface UserServiceInter {
	public List<UserDto> getUserFriendData(int userNum);
	public int getUserFriendCount(int userNum);
}
