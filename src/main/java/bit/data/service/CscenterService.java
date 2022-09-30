package bit.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.data.dao.CscenterDaoInter;
import bit.data.dto.FaqCategoryDto;
import bit.data.dto.FaqDto;
import bit.data.dto.NoticeDto;
import bit.data.dto.QnaCategoryDto;
import bit.data.dto.QnaDto;

@Service
public class CscenterService implements CscenterServiceInter {
	
	@Autowired
	CscenterDaoInter cscenterDao;

	@Override
	public List<FaqDto> getFaq() {
		// TODO Auto-generated method stub
		return cscenterDao.getFaq();
	}
	@Override
	public List<FaqDto> getFaqByNum(int num) {
		// TODO Auto-generated method stub
		return cscenterDao.getFaqByNum(num);
	}
	@Override
	public String selFaqCategory(int num) {
		// TODO Auto-generated method stub
		return cscenterDao.selFaqCategory(num);
	}
	@Override
	public List<FaqDto> getSearchFaq(String searchword) {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("searchword", searchword);
		return cscenterDao.getSearchFaq(map);
	}
	@Override
	public int getTcFaq(String searchword) {
		// TODO Auto-generated method stub
		Map<String, String> map=new HashMap<String, String>();
		map.put("searchword", searchword);
		return cscenterDao.getTcFaq(map);
	}
	@Override
	public List<NoticeDto> getAllNotice() {
		// TODO Auto-generated method stub
		return cscenterDao.getAllNotice();
	}
	
	@Override
	public List<FaqCategoryDto> getFaqCategory() {
		// TODO Auto-generated method stub
		return cscenterDao.getFaqCategory();
	}
	@Override
	    public List<QnaCategoryDto> selQnaCategory() {
	       // TODO Auto-generated method stub
	       
	       return cscenterDao.selQnaCategory();
	      }
	    
	    @Override
	    public void insertQna(QnaDto dto) {

	       cscenterDao.insertQna(dto);
	      }

}
