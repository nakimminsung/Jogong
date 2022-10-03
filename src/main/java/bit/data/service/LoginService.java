package bit.data.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.data.dao.LoginDaoInter;
import bit.data.dto.UserDto;

@Service
public class LoginService implements LoginServiceInter {
	
	@Autowired
	LoginDaoInter logindao;

	@Override
	public int getIdPassCheck(String id, String pass) {
		// TODO Auto-generated method stub
		Map<String, String> map=new HashMap<String, String>();
		map.put("loginid", id);
		map.put("loginpass", pass);
		return logindao.getIdPassCheck(map);
	}

	@Override
	public UserDto getDataById(String id) {
		// TODO Auto-generated method stub
		return logindao.getDataById(id);
	}
	
	

}
