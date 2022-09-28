package bit.data.service;

import java.util.List;
import java.util.Map;

import bit.data.dto.FaqCategoryDto;
import bit.data.dto.FaqDto;
import bit.data.dto.NoticeDto;

public interface CscenterServiceInter {

	public List<FaqDto> getFaq();
	public List<String> selQnaCategory();
	public List<FaqDto> getFaqByNum(int num);
	public List<FaqCategoryDto> selFaqCategory(int num);
	public List<FaqDto> getSearchFaq(String searchword);
	public int getTcFaq(String searchword);
	public List<NoticeDto> getAllNotice();
}
