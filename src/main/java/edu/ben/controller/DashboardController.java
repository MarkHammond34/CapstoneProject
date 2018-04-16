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

    @Autowired
    ImageService imageService;

    @Autowired
    PickUpService pickUpService;

    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public ModelAndView showDashboard(HttpServletRequest request, HttpSession session) {

        if (request.getSession(false) == null) {

            return new ModelAndView("redirect:/"); // Might change to different page later. Maybe login page.
        } else {
            System.out.println("Already a session");
        }

        ModelAndView model = new ModelAndView("dashboard2");

        session = request.getSession();
        User user = (User) session.getAttribute("user");

        List<Listing> listings = listingService.getAllListings();
        List<Listing> activeListings = listingService.getActiveListingsByUserId(user.getUserID());
        List<Listing> inactiveListings = listingService.getInActiveListingsByUserId(user.getUserID());
        List<Offer> offers = offerService.getOffersByUserId(user.getUserID());
        List<Transaction> transactions = transactionService.getTransactionsByUserID(user.getUserID());
        List<PickUp> pickUps = pickUpService.getAllActive();

        model.addObject("title", "Dashboard");

        model.addObject("allListings", listings);
        model.addObject("activeListings", activeListings);
        model.addObject("inactiveListings", inactiveListings);

        model.addObject("offers", offers);
        model.addObject("pickUps", pickUps);
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
