package edu.ben.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import edu.ben.model.Listing;
import edu.ben.model.Offer;
import edu.ben.model.Transaction;
import edu.ben.model.User;
import edu.ben.service.ListingService;
import edu.ben.service.NotificationService;
import edu.ben.service.OfferService;
import edu.ben.service.TransactionService;
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

	@Autowired
	TransactionService transactionService;

	@RequestMapping(value = "/myOffers", method = RequestMethod.GET) // An offers page for each listing
	public ModelAndView showOffers(@RequestParam("id") int id) {

		ModelAndView model = new ModelAndView("offers");

		Listing listing = listingService.getByListingID(id);
		List<Offer> offers = offerService.getPendingOffersByListingId(listing.getId());
		
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

		Listing listing;

		try {

			listing = listingService.getByListingID(id);

		} catch (Exception e) {
			System.out.println("Error"); // Do something with error messaging here
			e.printStackTrace();
			return model;
		}

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
		model.addObject("listingId", id);

		try {

			listing = listingService.getByListingID(id);
			User receiver = userService.getUserById(listing.getUser().getUserID());
			offer = new Offer(price, message, sender, listing);

			// do an if check here for an existing offer to update

			if (offerService.getOfferByUserAndListingId(sender.getUserID(), id) == null) {
				
				// Create a new offer in the database
				System.out.println("Creating");
				offer.setStatus("pending");
				offerService.createOffer(offer);
				
			} else {
				
				// Replace current offer
				System.out.println("Updating");
				offer.setStatus("pending");
				offerService.saveOrUpdate(offer);
				offerService.deleteOffer(offerService.getOfferByUserAndListingId(sender.getUserID(), id));
				
			}

			// Notify seller
			String subject = "You have a new offer!";
			String notificationMessage = sender.getUsername() + " has made an offer on " + listing.getName() + "!";
			Date date = new Date();
			Timestamp timeSent = new Timestamp(date.getTime());

			// Notification notification = new Notification(receiver, listing.getId(),
			// subject, notificationMessage, timeSent, 1);
			// notificationService.save(notification);

		} catch (Exception e) {
			
			e.printStackTrace();
			ModelAndView model2 = new ModelAndView("makeOffer");
			addErrorMessage("An error occurred processing your request. Please try again.");
			return model2;
			
		}

		return model;

	}

	@RequestMapping(value = "/acceptOffer", method = RequestMethod.GET)
	public ModelAndView acceptOffer(@RequestParam("offererID") int id, @RequestParam("listing") int listingID,
			HttpServletRequest request) {

		ModelAndView model = new ModelAndView("offers");

		User lister = (User) request.getSession().getAttribute("user");
		Listing listing = listingService.getByListingID(listingID);
		Offer offer = offerService.getOfferByUserAndListingId(id, listingID);
		User receiver = userService.getUserById(offer.getUserID().getUserID());

		// maybe popup confirming that you want to accept an offer

		// notify offerer
		String subject = "Congratulations!";
		String notificationMessage = "Your offer of " + offer.getOfferAmount() + " on " + listing.getName()
				+ " has been accepted by " + lister.getUsername() + "!";
		Date date = new Date();
		Timestamp timeSent = new Timestamp(date.getTime());

		// Notification notification = new Notification(receiver, listing.getId(),
		// subject, notificationMessage, timeSent, 1);
		// notificationService.save(notification);

		// remove all offers from offer page for this listing
		List<Offer> offers = offerService.getOffersByListingId(listing.getId()); 
		listingService.updateListingActiveStatusByID(0, listingID); 
		
		// move offer/listing to current transaction page
		Transaction transaction = new Transaction(lister.getUserID(), receiver.getUserID(), listing, offer);
		transactionService.createTransaction(transaction);
		
		for (Offer offerr: offers) {
			// notify losers
			subject = "Better luck next time";
			notificationMessage = "Your offer of " + offer.getOfferAmount() + " on " + listing.getName()
					+ " has been rejected by " + lister.getUsername() + "!";
			date = new Date();
			timeSent = new Timestamp(date.getTime());

			// Notification notification = new Notification(receiver, listing.getId(),
			// subject, notificationMessage, timeSent, 1);
			// notificationService.save(notification);
			
			// remove listing from selling view 
			offerr.setActive(0);
			offerService.saveOrUpdate(offerr);
		}

		return model;

	}

	@RequestMapping(value = "/rejectOffer", method = RequestMethod.GET)
	public ModelAndView rejectOffer(@RequestParam("offererID") int id, @RequestParam("listing") int listingID,
			HttpServletRequest request) {

		ModelAndView model = new ModelAndView("offers");

		User lister = (User) request.getSession().getAttribute("user");
		Offer offer = offerService.getOfferByUserAndListingId(id, listingID);
		Listing listing = listingService.getByListingID(listingID);

		// Are you sure you want to reject this?

		// no? - cancel popup

		// yes?

		// send notification to offerer that their offer was rejected

		// Notify seller
		String subject = "Rejected!";
		String notificationMessage = "Your offer of " + offer.getOfferAmount() + " on " + listing.getName()
				+ " has been rejected by " + lister.getUsername() + ".";
		Date date = new Date();
		Timestamp timeSent = new Timestamp(date.getTime());

		// Notification notification = new Notification(receiver, listing.getId(),
		// subject, notificationMessage, timeSent, 1);
		// notificationService.save(notification);

		// remove offer from page and db
		//offerService.deleteOffer(offer);
		offerService.saveOrUpdate(new Offer(offer.getOfferID(), offer.getOfferAmount(), offer.getOfferMessage(), offer.getImagePath(), offer.getUserID(), listing, "rejected"));

		// maybe ask offerer when they receive notification if they want to re-offer? -
		// possibly in a different controller

		List<Offer> offers = offerService.getOffersByListingId(listing.getId());

		model.addObject("offers", offers);
		
		System.out.println("Rejected");

		return model;

	}
}