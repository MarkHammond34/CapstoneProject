package edu.ben.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.ben.model.Listing;
import edu.ben.service.ListingService;

@Controller
public class HomeController extends BaseController {
	
	@Autowired
	ListingService listingService;

	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView home() {
		ModelAndView model = new ModelAndView("index");
		
		List<Listing> recent = listingService.getRecentListings();
		model.addObject("recentListings", recent);

		List<Listing> endingSoon = listingService.getRecentListings();
		endingSoon.remove(0);
		model.addObject("endingSoonListings", endingSoon);

		List<Listing> trending = listingService.getRecentListings();
		trending.remove(1);
		model.addObject("trendingListings", trending);
		
		return model;
	}
}