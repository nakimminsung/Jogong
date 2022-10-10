package bit.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.data.dao.TagDaoInter;
import bit.data.dto.TagDto;

@Service
public class TagService implements TagServiceInter {

    @Autowired
    TagDaoInter tagDaoInter;
    
    @Override
    public List<TagDto> selectTag() {
        return tagDaoInter.selectTag();
    }

    @Override
    public TagDto selectTagByNum(int num) {
        return tagDaoInter.selectTagByNum(num);
    }
}
