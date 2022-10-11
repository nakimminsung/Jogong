package bit.data.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BrandDao implements BrandDaoInter{

	@Autowired
	SqlSession session;
	String ns = "bit.data.dao.BrandDao.";
	
	@Override
	public List<String> getAllBrand() {
		return session.selectList(ns+"getAllBrand");
	}
	
}
