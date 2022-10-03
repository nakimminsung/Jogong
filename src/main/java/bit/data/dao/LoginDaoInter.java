package bit.data.dao;

import java.util.Map;

import bit.data.dto.UserDto;

public interface LoginDaoInter {

	public int getIdPassCheck(Map<String, String> map);
	public UserDto getDataById(String id);
}
