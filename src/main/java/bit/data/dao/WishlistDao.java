package bit.data.dao;

import java.util.List;
import java.util.Map;

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
	public List<WishlistDto> selectPublicWishlist(int userNum){
		return session.selectList(ns+"selectPublicWishlist", userNum);
	}

	@Override
    public List<WishlistDto> selectUserWishlist(int userNum) {
        return session.selectList(ns+"selectUserWishlist", userNum);
    }

    @Override
	public void insertWishlist(WishlistDto wishlistDto) {
		session.selectOne(ns+"insertWishlist", wishlistDto);
	}

    @Override
    public void updateWishlist(Map<String,Object> map) {
        session.selectOne(ns+"updateWishlist", map);
    }

    @Override
    public void deleteWishlist(int num) {
        session.selectOne(ns+"deleteWishlist", num);
    }

    @Override
    public int selectPublicWishCount(int userNum) {
        return session.selectOne(ns+"selectPublicWishCount", userNum);
    }
}
