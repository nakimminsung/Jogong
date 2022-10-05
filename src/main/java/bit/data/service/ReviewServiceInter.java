package bit.data.service;

import java.util.List;

import bit.data.dto.ReviewDto;

public interface ReviewServiceInter {
	public int getRating(int num);
	public int getRatingNum(int num);
	//리뷰페이지
	public int getTotalCount(String searchcolumn, String searchword);
	public List<ReviewDto> getPagingList(String searchcolumn, String searchword, int startnum, int perpage);
}
