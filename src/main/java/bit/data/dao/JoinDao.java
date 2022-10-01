package bit.data.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.data.dto.UserDto;

@Repository
public class JoinDao implements JoinDaoInter {
	
	@Autowired
	SqlSession session;
	String ns="bit.data.dao.JoinDao.";

	@Override
	public void insertUser(UserDto dto) {
		// TODO Auto-generated method stub
		session.insert(ns+"insertUser", dto);
	}

}
