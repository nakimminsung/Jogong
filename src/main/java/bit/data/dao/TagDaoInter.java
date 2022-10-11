package bit.data.dao;

import java.util.List;

import bit.data.dto.TagDto;

public interface TagDaoInter {
	public List<TagDto> selectTag();
	public TagDto selectTagByNum(int num);
}
