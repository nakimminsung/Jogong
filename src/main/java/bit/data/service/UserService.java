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
	public List<UserDto> getUserFriendData(Map<String,Object> map) {
		return userDaoInter.getUserFriendData(map);
	}

	@Override
	public int getUserFriendCount(int userNum) {
		return userDaoInter.getUserFriendCount(userNum);
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

	@Override
	public void updateUser(UserDto dto) {
		// TODO Auto-generated method stub
		userDaoInter.updateUser(dto);
	}
	

    @Override
    public List<UserDto> selectNonFriendlyUsersList(int num) {
        return userDaoInter.selectNonFriendlyUsersList(num);
    }
}
