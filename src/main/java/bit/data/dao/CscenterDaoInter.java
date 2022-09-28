package bit.data.dao;

import java.util.List;
import java.util.Map;

import bit.data.dto.FaqCategoryDto;
import bit.data.dto.FaqDto;
import bit.data.dto.NoticeDto;

public interface CscenterDaoInter {

	public List<FaqDto> getFaq();
	public List<String> selQnaCategory();
	public List<FaqDto> getFaqByNum(int num);
	public String selFaqCategory(int num);
	public List<FaqDto> getSearchFaq(Map<String, Object> map);
	public int getTcFaq(Map<String, String> map);
	public List<NoticeDto> getAllNotice();
}
