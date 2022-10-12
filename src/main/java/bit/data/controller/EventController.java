package bit.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EventController {
	
	@GetMapping("/event/event")
	public String brandPage() {
		return "/bit/event/event";
	}
}
