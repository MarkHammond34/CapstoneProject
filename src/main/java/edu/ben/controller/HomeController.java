package edu.ben.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import edu.ben.model.Listing;
import edu.ben.service.ListingService;

@Controller
public class HomeController {

	@Autowired
	ListingService listingService;
	
	@RequestMapping("/")
	public ModelAndView home() {
		
		ModelAndView model = new ModelAndView("index");
		List<Listing> recentListings = listingService.getRecentListings();
		
		model.addObject("recentListings", recentListings);
		
		return model;
	}
}