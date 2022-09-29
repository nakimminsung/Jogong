package bit.data.dao;

import java.util.List;

import bit.data.dto.UserDto;

public interface UserDaoInter {
	public List<UserDto> getUserFriendData(int userNum);
	public int getUserFriendCount(int userNum);
}
