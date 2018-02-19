package edu.ben.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.ben.model.Listing;
import edu.ben.service.ListingService;

@Controller
public class DonationsController {

	@Autowired
	ListingService listingService;

	@RequestMapping(value = "/donationLanding", method = RequestMethod.GET)
	public String landing(HttpServletRequest request) {
		ArrayList<Listing> donationList = (ArrayList<Listing>) listingService.findAllDonatedListings();
		System.out.println("donation size: " + donationList.size());
		
		request.setAttribute("donationList", donationList);

		return "donations";
	}

	@RequestMapping(value = "/donationCategory", method = RequestMethod.GET)
	public String donationCategory(HttpServletRequest request, @RequestParam("category") String category) {
		ArrayList<Listing> donationList = (ArrayList<Listing>) listingService.findAllDonatedListingsByCategory(category);
		System.out.println("donation category size: " + donationList.size());
		System.out.println("category: " + category);
		
		request.setAttribute("donationList", donationList);

		return "donations";

	}
}
