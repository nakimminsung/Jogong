package bit.data.dao;

import java.util.Map;

import bit.data.dto.SellerDto;

public interface SellerDaoInter {

	public void insertSeller(SellerDto dto);
	public int loginIdPassCheck(Map<String, String> map);
	public SellerDto getDataSeller(String email);
}
