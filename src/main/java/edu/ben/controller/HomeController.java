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
public class HomeController {
	
	@Autowired
	ListingService listingService;

	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView home() {
		ModelAndView model = new ModelAndView("index");
		
		List<Listing> listings = listingService.getRecentListings();
		model.addObject("listings", listings);
		
		return model;
	}
}