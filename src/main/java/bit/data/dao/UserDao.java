package bit.data.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.data.dto.QnaDto;
import bit.data.dto.UserDto;

@Repository
public class UserDao implements UserDaoInter {

	@Autowired
	SqlSession session;
	
	String ns = "bit.data.dao.UserDao.";
	
	@Override
	public List<UserDto> selectFriendData(Map<String,Object> map) {
		return session.selectList(ns+"selectFriendData", map);
	}
	
	@Override
	public List<UserDto> selectFreindRequest(Map<String,Object> map) {
	    return session.selectList(ns+"selectFreindRequest", map);
	}

	@Override
	public int getUserFriendCount(HashMap<String,Object> map) {
		return session.selectOne(ns+"getUserFriendCount", map);
	}
	
	@Override
	public void insertUser(UserDto dto) {
		// TODO Auto-generated method stub
		session.insert(ns+"insertUser", dto);
	}

	@Override
	public int getUserIdSearch(String email) {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"getUserIdSearch", email);
	}
	@Override
	public int getIdPassCheck(Map<String, String> map) {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"loginIdPassCheck", map);
	}

	@Override
	public UserDto getDataById(String email) {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"getDataById", email);
	}
	
	// 리뷰
	@Override
	public List<UserDto> getReviewUserInfo() {
		// TODO Auto-generated method stub
		return session.selectList(ns+"getReviewUserInfo");	
	}

    @Override
    public List<UserDto> selectNonFriendlyUsersList(Map<String,Object> map) {
        return session.selectList(ns+"selectNonFriendlyUsersList", map);
    }

	//회원정보 수정
	@Override
	public void updateUser(UserDto dto) {
		// TODO Auto-generated method stub
		session.update(ns+"updateUser", dto);
	}
	
	
	// 마이페이지 문의내역
	@Override
	public List<QnaDto> getQnaList(int userNum) {
		// TODO Auto-generated method stub
		
		return session.selectList(ns+"getQnaList",userNum);
	}

	//아이디 찾기
	@Override
	public String searchId(Map<String, String> map) {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"searchId", map);
	}

	// 친구추가
    @Override
    public void insertFriend(HashMap<String, Object> map) {
        session.selectList(ns+"isertFriend", map);
    }
    
    // 친구삭제
    @Override
    public void deleteFriend(HashMap<String, Object> map) {
        session.selectOne(ns+"deleteFriend", map);
    }
    
    // 친구요청 수락
    @Override
    public void updateFriend(HashMap<String, Object> map) {
        session.selectOne(ns+"updateFriend", map);
    }
    
    // 단일 유저 조회
    @Override
    public UserDto selectUser(int userNum) {
        return session.selectOne(ns+"selectUser", userNum);
    }
}
