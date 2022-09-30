package bit.data.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDao implements ReviewDaoInter {
	@Autowired
	SqlSession session;
	String ns = "bit.data.dao.ReviewDao.";
	
	@Override
	public int getRating(int num) {
		
		return session.selectOne(ns+"reviewRating", num);
	}

	@Override
	public int getRatingNum(int num) {
	
		return session.selectOne(ns+"reviewRatingNum", num);
	}
}
