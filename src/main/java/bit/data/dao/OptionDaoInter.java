package bit.data.dao;

import java.util.List;

import bit.data.dto.OptionDto;

public interface OptionDaoInter {
	public List<OptionDto> getAllOption(int productNum);
}
