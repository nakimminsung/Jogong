package bit.data.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.data.dto.FaqCategoryDto;
import bit.data.dto.FaqDto;


@Repository
public class CscenterDao implements CscenterDaoInter {

	@Autowired
	SqlSession session;
	String ns="bit.data.dao.CscenterDao.";
	@Override
	public List<FaqDto> getFaq() {
		// TODO Auto-generated method stub
		return session.selectList(ns+"getFaq");
	}   
	   //seleQnaCategory
	@Override
	   public List<String> selQnaCategory() {
	      
	      return session.selectList(ns+"selQnaCategory");
	   }
	@Override
	public List<FaqDto> getFaqByNum(int num) {
		// TODO Auto-generated method stub
		return session.selectList(ns+"getFaqByNum",num);
	}
	@Override
	public List<FaqCategoryDto> selFaqCategory(int num) {
		// TODO Auto-generated method stub
		return session.selectList(ns+"selFaqCategory",num);
	}
	
	
	
}
