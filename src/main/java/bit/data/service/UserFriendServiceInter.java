package bit.data.service;

import java.util.List;

import bit.data.dto.UserFriendDto;

public interface UserFriendServiceInter {
	public List<UserFriendDto> getFriendlist(int userNum);
}
