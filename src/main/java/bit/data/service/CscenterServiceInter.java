package bit.data.service;

import java.util.List;

import bit.data.dto.FaqDto;

public interface CscenterServiceInter {

	public List<FaqDto> getFaq();
	public List<String> selQnaCategory();
}
