package bit.data.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import bit.data.dao.UserDaoInter;
import bit.data.dto.KakaoDto;
import bit.data.dto.UserDto;

@Service
public class UserService implements UserServiceInter {

	@Autowired
	UserDaoInter userDaoInter;
	
	@Override
	public List<UserDto> getUserFriendData(int userNum) {
		
		return userDaoInter.getUserFriendData(userNum);
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
}
