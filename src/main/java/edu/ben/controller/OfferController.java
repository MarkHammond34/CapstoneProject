package edu.ben.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import edu.ben.model.Listing;
import edu.ben.model.Offer;
import edu.ben.service.ListingService;
import edu.ben.service.OfferService;

@Controller
public class OfferController {
	
	@Autowired
	OfferService offerService;
	
	@Autowired
	ListingService listingService;
	
	@RequestMapping(value="/myOffers", method=RequestMethod.GET)
	public ModelAndView showOffers(@RequestParam("id") int id) {
		
		ModelAndView model = new ModelAndView("offers");
		
		Listing listing = listingService.getByListingID(id); 
		List<Offer> offers = offerService.getOffersById(listing.getOfferID().getOfferID());
		
		model.addObject("offers", offers);
		
		return model;
		
	}

}
