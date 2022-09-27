package bit.data.dao;

import java.util.List;

import bit.data.dto.FaqDto;

public interface CscenterDaoInter {

	public List<FaqDto> getFaq();
	public List<String> selQnaCategory();
}
