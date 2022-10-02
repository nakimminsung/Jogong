package bit.data.service;

import java.util.List;

import bit.data.dto.FaqCategoryDto;
import bit.data.dto.FaqDto;
import bit.data.dto.NoticeDto;
import bit.data.dto.QnaCategoryDto;
import bit.data.dto.QnaDto;

public interface CscenterServiceInter {

	public List<FaqDto> getFaq();
	public List<FaqDto> getFaqByNum(int num);
	public String selFaqCategory(int num);
	public List<FaqDto> getSearchFaq(String searchword);
	public int getTcFaq(String searchword);
	public List<NoticeDto> getAllNotice();
	public List<FaqCategoryDto> getFaqCategory();
	
	//QNA
	public List<QnaCategoryDto> selQnaCategory();
	public void insertQna(QnaDto dto);
}
