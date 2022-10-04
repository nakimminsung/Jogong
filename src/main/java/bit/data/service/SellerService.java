package bit.data.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.data.dao.SellerDaoInter;
import bit.data.dto.SellerDto;

@Service
public class SellerService implements SellerServiceInter {

	//초기 세팅
	@Autowired
	SellerDaoInter SellerDao;
	
	//insert Seller
	@Override
	public void insertSeller(SellerDto dto) {

		SellerDao.insertSeller(dto);
	
	}
	
	//로그인 상태 체크 (ID/PW일치하면 count ==1)
	@Override
	public int loginIdPassCheck(String email, String password) {
		// TODO Auto-generated method stub
		
		Map<String, String> map=new HashMap<String, String>();
		map.put("email", email);	//반드시 mapper 와 일치시킬것
		map.put("password", password);
		
		return SellerDao.loginIdPassCheck(map);
	}
	
	//로그인 정보 가져오기
	@Override
	public SellerDto getDataSeller(String email) {
		// TODO Auto-generated method stub
		return SellerDao.getDataSeller(email);
	}
}
