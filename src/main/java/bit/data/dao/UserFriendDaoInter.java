package bit.data.dao;

import java.util.List;

import bit.data.dto.UserFriendDto;

public interface UserFriendDaoInter {
	public List<UserFriendDto> getFriendlist(int userNum);
}
