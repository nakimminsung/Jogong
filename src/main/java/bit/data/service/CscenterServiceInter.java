package bit.data.service;

import java.util.List;

import bit.data.dto.FaqCategoryDto;
import bit.data.dto.FaqDto;

public interface CscenterServiceInter {

	public List<FaqDto> getFaq();
	public List<String> selQnaCategory();
	public List<FaqDto> getFaqByNum(int num);
	public List<FaqCategoryDto> selFaqCategory(int num);
}
