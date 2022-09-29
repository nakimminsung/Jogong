package bit.data.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import bit.data.service.WishlistServiceInter;

@Controller
public class WishlistController {
	
	@Autowired
	WishlistServiceInter wishlistServiceInter;
	
}
