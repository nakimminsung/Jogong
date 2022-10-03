package bit.data.dao;

import bit.data.dto.UserDto;

public interface JoinDaoInter {

	public void insertUser(UserDto dto);
	public int getUserIdSearch(String email);
	
}
