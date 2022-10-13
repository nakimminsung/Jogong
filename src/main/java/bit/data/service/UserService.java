package bit.data.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.data.dao.UserDaoInter;
import bit.data.dto.QnaDto;
import bit.data.dto.UserDto;

@Service
public class UserService implements UserServiceInter {

	@Autowired
	UserDaoInter userDaoInter;
	
	@Override
	public List<UserDto> selectFriendData(Map<String,Object> map) {
		return userDaoInter.selectFriendData(map);
	}
	
	@Override
	public List<UserDto> selectFreindRequest(Map<String,Object> map) {
	    return userDaoInter.selectFreindRequest(map);
	}

	@Override
	public int getUserFriendCount(HashMap<String,Object> map) {
		return userDaoInter.getUserFriendCount(map);
	}
	
	@Override
	public void insertUser(UserDto dto) {
		// TODO Auto-generated method stub
		userDaoInter.insertUser(dto);
	}

	@Override
	public int getUserIdSearch(String email) {
		// TODO Auto-generated method stub
		return userDaoInter.getUserIdSearch(email);
	}
	//session 저장
	@Override
	public int getIdPassCheck(String email, String password) {
		// TODO Auto-generated method stub
		Map<String, String> map=new HashMap<String, String>();
		map.put("loginid", email);
		map.put("loginpass", password);
		return userDaoInter.getIdPassCheck(map);
	}

	@Override
	public UserDto getDataById(String email) {
		// TODO Auto-generated method stub
		return userDaoInter.getDataById(email);
	}

	// 리뷰페이지
	@Override
	public List<UserDto> getReviewUserInfo() {
		// TODO Auto-generated method stub
		return userDaoInter.getReviewUserInfo();
	}
	
	// 마이페이지 문의내역
	@Override
	public List<QnaDto> getQnaList(int userNum) {
		// TODO Auto-generated method stub
		
		return userDaoInter.getQnaList(userNum);
	}
	//회원정보 수정
	@Override
	public void updateUser(UserDto dto) {
		// TODO Auto-generated method stub
		userDaoInter.updateUser(dto);
	}
	
    @Override
    public List<UserDto> selectNonFriendlyUsersList(Map<String,Object> map) {
        return userDaoInter.selectNonFriendlyUsersList(map);
    }

    //아이디찾기
	@Override
	public String searchId(String nickname, String phone) {
		// TODO Auto-generated method stub
		Map<String, String> map=new HashMap<String, String>();
		map.put("nickname",nickname);
		map.put("phone",phone);
		return userDaoInter.searchId(map);
	}
	
	// 친구추가
    @Override
    public void insertFriend(HashMap<String, Object> map) {
        userDaoInter.insertFriend(map);
    }
    
    // 친구삭제
    @Override
    public void deleteFriend(HashMap<String, Object> map) {
        userDaoInter.deleteFriend(map);
    }
    
    // 친구요청 수락
    @Override
    public void updateFriend(HashMap<String, Object> map) {
        userDaoInter.updateFriend(map);
    }
    
    // 단일 유저 조회
    @Override
    public UserDto selectUser(int userNum) {
        return userDaoInter.selectUser(userNum);
    }
}
