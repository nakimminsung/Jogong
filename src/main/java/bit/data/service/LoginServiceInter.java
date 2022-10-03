package bit.data.service;

import bit.data.dto.UserDto;

public interface LoginServiceInter {
	
	public int getIdPassCheck(String id,String pass);
	public UserDto getDataById(String id);

}
