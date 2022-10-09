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

	// 상세페이지 
	@Override
	public List<ReviewDto> getProductReviewList(int productNum) {
		
		return session.selectList(ns+"getReviewByProduct", productNum);
	}
	
	// 상세페이지 리뷰수 
	@Override
	public int getReviewCount(int productNum) {
		
		return session.selectOne(ns+"getReviewCount", productNum);
	}
	
	// 마이페이지 작성한 리뷰목록
    @Override
    public List<ReviewDto> selectReviewByUser(int userNum) {
        return session.selectList(ns+"selectReviewByUser", userNum);
    }
    
    // 마이페이지 리뷰수
    @Override
    public int selectReviewCount(int userNum) {
        return session.selectOne(ns+"selectReviewCount", userNum);
    }
    
    // 리뷰 생성
    @Override
    public void insertReview(ReviewDto reviewDto) {
        session.selectOne(ns+"insertReview", reviewDto);
    }
}
