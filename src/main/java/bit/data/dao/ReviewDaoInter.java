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
}
