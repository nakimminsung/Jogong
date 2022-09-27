package bit.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.data.dao.CscenterDaoInter;
import bit.data.dto.FaqDto;

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
	   public List<String> selQnaCategory() {
	      // TODO Auto-generated method stub
	      
	      return cscenterDao.selQnaCategory();
	   }

	
}
