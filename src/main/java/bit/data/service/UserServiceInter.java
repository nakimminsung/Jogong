package bit.data.service;

import java.util.List;

import bit.data.dto.KakaoDto;
import bit.data.dto.UserDto;

public interface UserServiceInter {
	public List<UserDto> getUserFriendData(int userNum);
	public int getUserFriendCount(int userNum);
	public void insertUser(UserDto dto);
	public int getUserIdSearch(String email);
	public int getIdPassCheck(String email, String password);
	public UserDto getDataById(String email);
	
	//카카오테스트
	public String getAccessToken (String authorize_code);
	public KakaoDto getKakaoInfo(String access_Token);
}
