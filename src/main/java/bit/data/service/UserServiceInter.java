package bit.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bit.data.dto.QnaDto;
import bit.data.dto.UserDto;

public interface UserServiceInter {
	public List<UserDto> selectFriendData(Map<String,Object> map);
	public List<UserDto> selectFreindRequest(Map<String,Object> map);
	public int getUserFriendCount(HashMap<String,Object> map);
	public void insertUser(UserDto dto);
	public int getUserIdSearch(String email);
	public int getIdPassCheck(String email, String password);
	public UserDto getDataById(String email);

	// 리뷰페이지
	public List<UserDto> getReviewUserInfo();
	public List<UserDto> selectNonFriendlyUsersList(Map<String,Object> map);
	//public void insertKakao(UserDto dto);

	//회원정보수정
	public void updateUser(UserDto dto);
	
	// 마이페이지 문의내역
	public List<QnaDto> getQnaList(int userNum);
	
	//아이디 찾기
	public String searchId(String nickname,String phone);
	
	//비밀번호 찾기 전 정보확인 및 정보 가져오기
	public UserDto searchPass(String nickname,String email);

	// 친구 추가
    public void insertFriend(HashMap<String,Object> map);
    
    // 친구 삭제
    public void deleteFriend(HashMap<String,Object> map);
    
    // 친구 요청 수락
    public void updateFriend(HashMap<String,Object> map);
    
    // 단일 유저 조회
    public UserDto selectUser(int userNum);

    
    // 비번찾기 후 수정
  	public void updateUserPass(UserDto dto);



}
