package bit.data.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.data.dto.OptionDto;

@Repository
public class OptionDao implements OptionDaoInter {

	@Autowired
	SqlSession session;
	String ns="bit.data.dao.OptionDao.";
	
	@Override
	public List<OptionDto> getAllOption(int productNum) {

		return session.selectList(ns+"selectProductOption");
	}
	
}
