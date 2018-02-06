package edu.ben.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.ben.model.Listing;
import edu.ben.service.ListingService;

import javax.servlet.http.HttpServletRequest;

@Controller
public class HomeController extends BaseController {

	@Autowired
	ListingService listingService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(HttpServletRequest request) {
		ModelAndView model = new ModelAndView("index");

		List<Listing> recent = listingService.getRecentListings();
		model.addObject("recentListings", recent);

		List<Listing> endingSoon = listingService.getRecentListings();
		model.addObject("endingSoonListings", endingSoon);

		List<Listing> trending = listingService.getListingsByBidCount();
		model.addObject("trendingListings", trending);

		setRequest(request);
		return model;
	}

	@GetMapping("/contactUs")
	public String contactUs() {
		return "contactUs";
	}
}