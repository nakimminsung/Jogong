package bit.data.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDao implements ProductDaoInter {

	@Autowired
	SqlSession session;
	
	String ns = "bit.data.dao.ProductDao.";
}
