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
}
