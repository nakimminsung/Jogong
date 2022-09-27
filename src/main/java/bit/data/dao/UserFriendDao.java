package bit.data.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.data.dto.UserFriendDto;

@Repository
public class UserFriendDao implements UserFriendDaoInter {

	@Autowired
	SqlSession session;
	
	String ns = "bit.data.dao.UserFriendDao.";
	
	@Override
	public List<UserFriendDto> getFriendlist(int userNum) {
		
		return session.selectList(ns+"getFriendlist", userNum);
	}
}
