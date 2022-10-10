package bit.data.service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.data.dao.ReviewDaoInter;
import bit.data.dto.ReviewDto;

@Service
public class ReviewService implements ReviewServiceInter{
	@Autowired
	ReviewDaoInter reviewDaoInter;
	
	@Override
	public int getRating(int num) {
		
		return reviewDaoInter.getRating(num);
	}

	@Override
	public int getRatingNum(int num) {
	
		return reviewDaoInter.getRatingNum(num);
	}

	@Override
	public int getTotalCount(String searchcolumn, String searchword) {
		
		 Map<String, String> map=new HashMap<String, String>();
	     map.put("searchcolumn",searchcolumn);
	     map.put("searchword", searchword);
	      
	     return reviewDaoInter.getTotalCount(map);
	}

	@Override
	public List<ReviewDto> getPagingList(String searchcolumn, String searchword, int startnum, int perpage) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		map.put("startnum", startnum);
		map.put("perpage", perpage);
		
		return reviewDaoInter.getPagingList(map);
	}

	// 상세페이지
	@Override
	public List<ReviewDto> getProductReviewList(int productNum) {
		
		return reviewDaoInter.getProductReviewList(productNum);
	}

	@Override
	public int getReviewCount(int productNum) {
		
		return reviewDaoInter.getReviewCount(productNum);
	}
	   
	// 마이페이지 작성한 리뷰목록
    @Override
    public List<ReviewDto> selectReviewByUser(int userNum) {
        return reviewDaoInter.selectReviewByUser(userNum);
    }

    // 마이페이지 리뷰수
    @Override
    public int selectReviewCount(int userNum) {
        return reviewDaoInter.selectReviewCount(userNum);
    }
    
    // 리뷰 생성
    @Override
    public void insertReview(ReviewDto reviewDto) {
        reviewDaoInter.insertReview(reviewDto);
    }
    
    // 리뷰 삭제
    @Override
    public void deleteReview(int num) {
        reviewDaoInter.deleteReview(num);
    }
}
