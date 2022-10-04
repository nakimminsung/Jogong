package bit.data.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.data.dto.WishlistDto;

@Repository
public class WishlistDao implements WishlistDaoInter {
	
	@Autowired
	SqlSession session;
	
	String ns = "bit.data.dao.WishlistDao.";
	
	@Override
	public List<WishlistDto> getWishlist(int userNum){
		return session.selectList(ns+"selectAllWishlist", userNum);
	}

	@Override
	public void insertWishlist(WishlistDto wishlistDto) {
		session.selectOne(ns+"insertWishlist", wishlistDto);
	};
	
}
