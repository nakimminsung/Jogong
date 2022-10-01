package bit.data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.data.dao.JoinDaoInter;
import bit.data.dto.UserDto;

@Service
public class JoinService implements JoinServiceInter {

	@Autowired
	JoinDaoInter joinDao;
	
	@Override
	public void insertUser(UserDto dto) {
		// TODO Auto-generated method stub
		joinDao.insertUser(dto);
		
	}

}
