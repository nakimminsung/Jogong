package bit.data.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.data.dto.UserDto;

@Repository
public class LoginDao implements LoginDaoInter {
	
	@Autowired
	SqlSession session;
	String ns="bit.data.dao.LoginDao.";

	@Override
	public int getIdPassCheck(Map<String, String> map) {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"loginIdPassCheck", map);
	}

	@Override
	public UserDto getDataById(String id) {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"getDataById", id);
	}

	
}
