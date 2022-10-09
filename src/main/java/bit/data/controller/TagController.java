package bit.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.data.dto.TagDto;
import bit.data.service.TagServiceInter;

@Controller
public class TagController {
        
    @Autowired
    TagServiceInter tagServiceInter;
        
    @GetMapping("/tag/select")
    @ResponseBody
    public List<TagDto> selectTag() {
        return tagServiceInter.selectTag();
    }
}
