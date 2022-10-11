package bit.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.data.dao.OptionDaoInter;
import bit.data.dto.OptionDto;

@Service
public class OptionService implements OptionServiceInter {
	
	@Autowired
	OptionDaoInter optionDaoInter;
	
	@Override
	public List<OptionDto> getAllOption(int productNum) {
		
		return optionDaoInter.getAllOption(productNum);
	}
	
}
