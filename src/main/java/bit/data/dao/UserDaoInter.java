package bit.data.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bit.data.dto.QnaDto;
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
	public List<UserDto> selectNonFriendlyUsersList(Map<String,Object> map);

	//회원정보수정
	public void updateUser(UserDto dto);
	// 마이페이지 문의내역
	public List<QnaDto> getQnaList(int userNum);
	//아이디 찾기
	public String searchId(Map<String, String> map);
	// 친구 추가
	public void insertFriend(HashMap<String,Object> map);
	// 친구 삭제
	public void deleteFriend(HashMap<String,Object> map);
}
