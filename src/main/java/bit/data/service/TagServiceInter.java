package bit.data.service;

import java.util.List;

import bit.data.dto.TagDto;

public interface TagServiceInter {
	public List<TagDto> selectTag();
	public TagDto selectTagByNum(int num);
}
