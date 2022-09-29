package bit.data.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.data.dto.FaqCategoryDto;
import bit.data.dto.FaqDto;
import bit.data.dto.NoticeDto;
import bit.data.dto.QnaCategoryDto;
import bit.data.dto.QnaDto;


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
	
	@Override
	public List<FaqDto> getFaqByNum(int num) {
		// TODO Auto-generated method stub
		return session.selectList(ns+"getFaqByNum",num);
	}
	@Override
	public String selFaqCategory(int num) {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"selFaqCategory",num);
	}
	@Override
	public List<FaqDto> getSearchFaq(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.selectList(ns+"getSearchFaq",map);
	}
	@Override
	public int getTcFaq(Map<String, String> map) {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"getTcFaq", map);
	}
	@Override
	public List<NoticeDto> getAllNotice() {
		// TODO Auto-generated method stub
		return session.selectList(ns+"getAllNotice");
	}
	
  //seleQnaCategory
   @Override
   public List<QnaCategoryDto> selQnaCategory() {

         return session.selectList(ns+"selQnaCategory");
      }
   
   //insertQna
   @Override
   public void insertQna(QnaDto dto) {

      session.insert(ns+"insertQna",dto);
   }
}
