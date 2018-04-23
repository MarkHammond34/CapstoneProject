package edu.ben.controller;

import edu.ben.model.*;
import edu.ben.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class DashboardController extends BaseController {

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

    @Autowired
    ImageService imageService;

    @Autowired
    PickUpService pickUpService;

    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public ModelAndView showDashboard(HttpServletRequest request, HttpSession session) {

        if (request.getSession(false) == null || session.getAttribute("user") == null) {

            addErrorMessage("Please log in or sign up");
            return new ModelAndView("redirect:login"); // Might change to different page later. Maybe login page.
        } else {
            //System.out.println("Already a session"); // For testing

            ModelAndView model = new ModelAndView("dashboard2");

            session = request.getSession();
            User user = (User) session.getAttribute("user");

            // Switcher content
            List<Listing> listings = listingService.getAllListingsByUserID(user.getUserID());
            List<Listing> activeListings = listingService.getActiveListingsByUserId(user.getUserID());
            List<Listing> inactiveListings = listingService.getInActiveListingsByUserId(user.getUserID());
            List<Listing> wonListings = listingService.getListingsWon(user.getUserID());
            List<Listing> lostListings = listingService.getListingsLost(user.getUserID());
            List<Listing> currentBidListings = listingService.getListingsInProgressUserBidOn(user.getUserID());
            List<Listing> soldListings = listingService.getListingsSold(user.getUserID());

            // Tables
            List<Offer> offers = offerService.getOffersByUserId(user.getUserID());
            List<Transaction> transactions = transactionService.getTransactionsByUserID(user.getUserID());
            List<PickUp> pickUps = pickUpService.getAllActive();

            model.addObject("title", "Dashboard");

            model.addObject("allListings", listings);
            model.addObject("activeListings", activeListings);
            model.addObject("inactiveListings", inactiveListings);
            model.addObject("wonListings", wonListings);
            model.addObject("lostListings", lostListings);
            model.addObject("currentBidListings", currentBidListings);
            model.addObject("soldListings", soldListings);

            model.addObject("offers", offers);
            model.addObject("pickUps", pickUps);
            model.addObject("transactions", transactions);

            return model;
        }
    }
}
