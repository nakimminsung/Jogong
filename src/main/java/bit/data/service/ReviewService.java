package bit.data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.data.dao.ReviewDaoInter;

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
}
