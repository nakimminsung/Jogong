package bit.data.service;

import java.util.List;
import java.util.Map;

import bit.data.dto.QnaDto;
import bit.data.dto.UserDto;

public interface UserServiceInter {
	public List<UserDto> getUserFriendData(Map<String,Object> map);
	public int getUserFriendCount(int userNum);
	public void insertUser(UserDto dto);
	public int getUserIdSearch(String email);
	public int getIdPassCheck(String email, String password);
	public UserDto getDataById(String email);

	// 리뷰페이지
	public List<UserDto> getReviewUserInfo();
	//public void insertKakao(UserDto dto);
	
	// 마이페이지 문의내역
	public List<QnaDto> getQnaList(int userNum);
}
