package bit.data.dao;

import java.util.List;
import java.util.Map;

import bit.data.dto.ReviewDto;

public interface ReviewDaoInter {
	public int getRating(int num);
	public int getRatingNum(int num);
	//리뷰페이지
	public int getTotalCount(Map<String, String> map);
	public List<ReviewDto> getPagingList(Map<String, Object> map);
	//상세페이지
	public List<ReviewDto> getProductReviewList(int productNum);
	//상세페이지 리뷰수
	public int getReviewCount(int productNum);
	// 마이페이지 작성한 리뷰목록
	public List<ReviewDto> selectReviewByUser(int userNum);
	// 마이페이지 리뷰수
	public int selectReviewCount(int userNum);
	// 리뷰 생성
	public void insertReview(ReviewDto reviewDto);
	// 리뷰 삭제
	public void deleteReview(int num);
	// 리뷰 단건 조회
	public ReviewDto selectReviewByNum(int num);
}
