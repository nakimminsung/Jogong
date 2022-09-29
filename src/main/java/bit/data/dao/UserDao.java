package bit.data.dao;

import java.util.List;

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
	
}
