package edu.ben.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CommunityController extends BaseController {

	@RequestMapping(value = "/communityPage", method = RequestMethod.POST)
	public ModelAndView community() {
		ModelAndView model = new ModelAndView("/community");
		//List<User> list = userService.getAllUsers();
		
		//model.addObject("list", list);
		

		return model;
	}
	
	@RequestMapping(value = "/feedback", method = RequestMethod.POST)
	public ModelAndView feedback() {
		

		return new ModelAndView("redirect:/community");
	}
	
	
}
