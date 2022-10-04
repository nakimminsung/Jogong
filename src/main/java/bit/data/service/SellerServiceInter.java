package bit.data.service;

import bit.data.dto.SellerDto;

public interface SellerServiceInter {

	public void insertSeller(SellerDto dto);	
	public int loginIdPassCheck(String email, String password);
	public SellerDto getDataSeller(String email);
}
