package bit.data.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.data.dto.UserDto;

@Repository
public class UserDao implements UserDaoInter {

	@Autowired
	SqlSession session;
	
	String ns = "bit.data.dao.UserDao.";
	
	@Override
	public List<UserDto> getUserFriendData(int userNum) {
		return session.selectList(ns+"getUserFriendData", userNum);
	}

	@Override
	public int getUserFriendCount(int userNum) {
		return session.selectOne(ns+"getUserFriendCount", userNum);
	}
	
	@Override
	public void insertUser(UserDto dto) {
		// TODO Auto-generated method stub
		session.insert(ns+"insertUser", dto);
	}

	@Override
	public int getUserIdSearch(String email) {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"getUserIdSearch", email);
	}
	@Override
	public int getIdPassCheck(Map<String, String> map) {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"loginIdPassCheck", map);
	}

	@Override
	public UserDto getDataById(String email) {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"getDataById", email);
	}

	// 리뷰
	@Override
	public List<UserDto> getReviewUserInfo() {
		// TODO Auto-generated method stub
		return session.selectList(ns+"getReviewUserInfo");	
	}
}
