package bit.data.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.data.dto.ReviewDto;

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

	// 리뷰페이지
	@Override
	public int getTotalCount(Map<String, String> map) {
		
		return session.selectOne(ns+"getTotalCount",map);
	}

	@Override
	public List<ReviewDto> getPagingList(Map<String, Object> map) {
		
		return session.selectList(ns+"getPagingList",map);
	}
	
	
}
