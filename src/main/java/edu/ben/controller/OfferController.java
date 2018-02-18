package edu.ben.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import edu.ben.model.Listing;
import edu.ben.model.Notification;
import edu.ben.model.Offer;
import edu.ben.model.User;
import edu.ben.service.ListingService;
import edu.ben.service.NotificationService;
import edu.ben.service.OfferService;
import edu.ben.service.UserService;

@Controller
public class OfferController extends BaseController {

	@Autowired
	OfferService offerService;

	@Autowired
	ListingService listingService;

	@Autowired
	UserService userService;

	@Autowired
	NotificationService notificationService;

	@RequestMapping(value = "/myOffers", method = RequestMethod.GET) // An offers page for each listing
	public ModelAndView showOffers(@RequestParam("id") int id) {

		ModelAndView model = new ModelAndView("offers");

		Listing listing = listingService.getByListingID(id);
		List<Offer> offers = offerService.getOffersById(listing.getOfferID().getOfferID());

		model.addObject("offers", offers);

		return model;

	}

	@RequestMapping(value = "/makeOffer", method = RequestMethod.GET)
	public ModelAndView makeOffer(@RequestParam("listing") int id, HttpServletRequest request) {

		User user = (User) request.getSession().getAttribute("user");

		if (user == null) {
			return new ModelAndView("redirect:/login");
		}

		ModelAndView model = new ModelAndView("makeOffer");

		// Maybe some indicator that you already made an offer on a listing. Potentially
		// a waiting page for current offers made

		Listing listing;
		List<Offer> offers = new ArrayList<Offer>();

		try {

			listing = listingService.getByListingID(id);
			// offers = offerService.getOffersById(listing.getOfferID().getOfferID());

		} catch (Exception e) {
			System.out.println("Error");
			e.printStackTrace();
			return model;
		}

		model.addObject("offers", offers);
		model.addObject("listing", listing);

		return model;

	}

	@RequestMapping(value = "/confirmOffer", method = RequestMethod.POST)
	public ModelAndView confirmOffer(@RequestParam("listing") int id, @RequestParam("offer-amount") int price,
			@RequestParam("offer-message") String message, HttpServletRequest request) {

		ModelAndView model = new ModelAndView("redirect:/listing");

		// Money is defaulted to $0. Can make money offer, message offer for something,
		// or both.

		// Maybe confirm offer popup

		// Notify seller

		Listing listing;
		Offer offer = new Offer();
		User sender = (User) request.getSession().getAttribute("user");

		try {

			listing = listingService.getByListingID(id);
			User receiver = userService.getUserById(listing.getUser().getUserID());
			offer = new Offer(price, message, sender);
			System.out.println(offer.getOfferAmount());
			System.out.println(offer.getUserID().getFirstName());
			offerService.createOffer(offer);

			// Notify seller
			String subject = "You have a new offer!";
			String notificationMessage = receiver.getUsername() + " has made an offer on " + listing.getName() + "!";
			Date date = new Date();
			Timestamp timeSent = new Timestamp(date.getTime());

			// Notification notification = new Notification(receiver, listing.getId(),
			// subject, notificationMessage, timeSent, 1);
			// notificationService.save(notification);

		} catch (Exception e) {
			System.out.println("Error");
			e.printStackTrace();
			ModelAndView model2 = new ModelAndView("makeOffer");
			addErrorMessage("An error occurred processing your request. Please try again.");
			return model2;
		}

		return model;

	}

	@RequestMapping(value = "/acceptOffer", method = RequestMethod.GET)
	public ModelAndView acceptOffer(@RequestParam("id") int id) {

		ModelAndView model = new ModelAndView("offers");

		// maybe popup confirming that you want to accept an offer

		// notify offerer

		// remove offer from offer page

		// remove listing from selling view

		// maybe move offer to current transaction page

		Listing listing = listingService.getByListingID(id);
		List<Offer> offers = offerService.getOffersById(listing.getOfferID().getOfferID());

		model.addObject("offers", offers);

		return model;

	}

	@RequestMapping(value = "/rejectOffer", method = RequestMethod.GET)
	public ModelAndView rejectOffer(@RequestParam("offerID") int id) {

		ModelAndView model = new ModelAndView("offers");

		// Are you sure you want to reject this?

		// no? - cancel popup

		// yes?

		// send notification to offerer that their offer was rejected

		// remove offer from page and db

		// maybe ask offerer when they receive notification if they want to re-offer? -
		// possibly in a different controller

		Listing listing = listingService.getByListingID(id);
		List<Offer> offers = offerService.getOffersById(listing.getOfferID().getOfferID());

		model.addObject("offers", offers);

		return model;

	}
}