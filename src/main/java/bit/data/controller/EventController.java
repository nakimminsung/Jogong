package bit.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.data.dto.EventDto;
import bit.data.service.EventServiceInter;

@Controller
public class EventController {
    
    @Autowired
    EventServiceInter eventServiceInter;
	
	@GetMapping("/event/event")
	public String brandPage() {
		return "/bit/event/event";
	}
	
	@GetMapping("/event/list")
	@ResponseBody
	public List<EventDto> selectEventList(){
	    return eventServiceInter.selectEventList();
	}
}
