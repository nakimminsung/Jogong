package bit.data.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.data.dto.SellerDto;

@Repository
public class SellerDao implements SellerDaoInter {

	//초기 세팅
	@Autowired
	SqlSession session;
	String ns="bit.data.dao.SellerDao.";
	
	
	//insertSeller
	@Override
	public void insertSeller(SellerDto dto) {

		session.insert(ns+"insertSeller",dto);
	
	}
	
	//로그인 상태 체크 (ID/PW일치하면 count ==1)
	@Override
	public int loginIdPassCheck(Map<String, String> map) {
		// TODO Auto-generated method stub
		
		return session.selectOne(ns+"loginIdPassCheck",map);
	}
	
	//로그인 정보 가져오기
	@Override
	public SellerDto getDataSeller(String email){
		
		return session.selectOne(ns+"getDataSeller",email);
	}
	
}
