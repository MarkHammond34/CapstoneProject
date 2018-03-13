package edu.ben.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.ben.model.Listing;
import edu.ben.model.Offer;
import edu.ben.model.Transaction;
import edu.ben.service.FollowService;
import edu.ben.service.ListingService;
import edu.ben.service.OfferService;
import edu.ben.service.TransactionService;
import edu.ben.service.UserService;

@Controller
public class DashboardController {

	@Autowired
	UserService userService;

	@Autowired
	FollowService followService;

	@Autowired
	ListingService listingService;

	@Autowired
	OfferService offerService;

	@Autowired
	TransactionService transactionService;

	@RequestMapping(value = "/dashboard-offers", method = RequestMethod.GET)
	public ModelAndView showActiveDash() {

		ModelAndView model = new ModelAndView("dashboard2");

		return model;
	}

	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public ModelAndView showDashboard() {

		ModelAndView model = new ModelAndView("dashboard2");

		List<Listing> listings = listingService.getAllListings();
		List<Offer> offers = offerService.getOffersByUserId(9);
		List<Transaction> transactions = transactionService.getTransactionsByUserID(9);

		System.out.println(listings.size());
		System.out.println(offers.size());
		if (transactions == null) {
			System.out.println("transactions are null");
		} else {
			System.out.println(transactions.size());
		}

		model.addObject("title", "Dashboard");
		model.addObject("listings", listings);
		model.addObject("offers", offers);
		model.addObject("transactions", transactions);

		return model;

	}

	@RequestMapping(value = "/dashboardTest", method = RequestMethod.GET)
	public ModelAndView test() {

		ModelAndView model = new ModelAndView("test");

		List<Listing> listings = listingService.getAllListings();

		System.out.println(listings.size());

		model.addObject("title", "Dashboard");
		model.addObject("listings", listings);

		return model;

	}
}
