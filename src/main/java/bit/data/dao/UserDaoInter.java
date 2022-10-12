package bit.data.dao;

import java.util.List;
import java.util.Map;

import bit.data.dto.UserDto;

public interface UserDaoInter {
	public List<UserDto> getUserFriendData(Map<String,Object> map);
	public int getUserFriendCount(int userNum);
	public void insertUser(UserDto dto);
	public int getUserIdSearch(String email);
	public int getIdPassCheck(Map<String, String> map);
	public UserDto getDataById(String email);
	// 리뷰페이지
	public List<UserDto> getReviewUserInfo();
	public void updateUser(UserDto dto);
	
}
