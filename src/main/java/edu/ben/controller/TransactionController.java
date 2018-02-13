package edu.ben.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import edu.ben.model.Listing;
import edu.ben.model.User;
import edu.ben.service.ListingService;
import edu.ben.util.Email;

@Controller
public class TransactionController extends BaseController {
	
	@Autowired
	ListingService listingService;

	@RequestMapping(value="/checkoutPage", method=RequestMethod.GET)
	public ModelAndView checkoutPage() {
		return new ModelAndView("checkout");
	}
	
	@RequestMapping(value="/button", method=RequestMethod.GET)
	public ModelAndView checkoutTest(@RequestParam("listing") int listingID, HttpServletRequest request) {
		
		Listing listing = listingService.getByListingID(listingID);
		User user = (User) request.getSession().getAttribute("user");
		
		listing.setActive(0);
		listingService.saveOrUpdate(listing);
		Email.sendEmail("Hello, From U-ListIt.com! Your listing: " + listing.getName() + " has been purchased.", "Your listing was purchased!", user.getSchoolEmail());
		addSuccessMessage("Congratulations, your purchase was a success!");
		
		return new ModelAndView("redirect:/");
	}
	
}
