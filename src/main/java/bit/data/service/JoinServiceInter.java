package bit.data.service;

import bit.data.dto.UserDto;

public interface JoinServiceInter {

	public void insertUser(UserDto dto);
	public int getUserIdSearch(String email);
}
