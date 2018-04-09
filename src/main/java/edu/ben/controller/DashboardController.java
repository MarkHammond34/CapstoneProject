package edu.ben.controller;

import edu.ben.model.Listing;
import edu.ben.model.Offer;
import edu.ben.model.Transaction;
import edu.ben.model.User;
import edu.ben.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
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

    @RequestMapping(value = "/dashboard-offers", method = RequestMethod.GET)
    public ModelAndView showActiveDash() {

        ModelAndView model = new ModelAndView("dashboard2");

        return model;
    }

    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public ModelAndView showDashboard(HttpServletRequest request) {

        if (request.getSession(false) == null) {

            return new ModelAndView("redirect:/"); // Might change to different page later. Maybe login page.
        } else {
            System.out.println("Already a session");
        }

        ModelAndView model = new ModelAndView("dashboard2");

        List<Listing> listings = listingService.getAllListings();
        int allSize = listings.size();
        List<Listing> activeListings = listingService.getActiveListingsByUserId(12);
        int activeSize = activeListings.size();
        List<Listing> inactiveListings = listingService.getInActiveListingsByUserId(12);
        int inactiveSize = inactiveListings.size();
        List<Offer> offers = offerService.getOffersByUserId(14);
        List<Transaction> transactions = transactionService.getTransactionsByUserID(9);

        System.out.println("Date created: " + listings.get(0).getDateCreated().getTime());
//        System.out.println(listings.size());
//        System.out.println(activeListings.size());
//        System.out.println(inactiveListings.size());
//        System.out.println(offers.size());
//        System.out.println(transactions.size());

        model.addObject("title", "Dashboard");

        model.addObject("allListings", listings);
        model.addObject("activeListings", activeListings);
        model.addObject("inactiveListings", inactiveListings);

        model.addObject("offers", offers);
        model.addObject("transactions", transactions);

        return model;

    }

    @RequestMapping(value = "/filterListings", method = RequestMethod.GET)
    public ModelAndView filterListings(HttpServletRequest request, @RequestParam("type") String filterType,
                                       @RequestParam("listings") List<Listing> list) {

        ModelAndView model = new ModelAndView("dashboard2");

        User user = (User) request.getAttribute("user");


        model.addObject("title", "Dashboard");

        return model;

    }

    @RequestMapping(value = "/filterOffers", method = RequestMethod.GET)
    public ModelAndView filterOffers(HttpServletRequest request, @RequestParam("type") String filterType,
                                     @RequestParam("offers") List<Listing> list) {

        ModelAndView model = new ModelAndView("dashboard2");

        User user = (User) request.getAttribute("user");

        model.addObject("title", "Dashboard");

        return model;

    }

    @RequestMapping(value = "/filterMeetings", method = RequestMethod.GET)
    public ModelAndView filterMeetings(HttpServletRequest request, @RequestParam("type") String filterType,
                                       @RequestParam("meetings") List<Listing> list) {

        ModelAndView model = new ModelAndView("dashboard2");

        User user = (User) request.getAttribute("user");

        model.addObject("title", "Dashboard");

        return model;

    }

    @RequestMapping(value = "/filterTransactions", method = RequestMethod.GET)
    public ModelAndView filterTransactions(HttpServletRequest request, @RequestParam("type") String filterType,
                                           @RequestParam("transactions") List<Listing> list) {

        ModelAndView model = new ModelAndView("dashboard2");

        User user = (User) request.getAttribute("user");

        model.addObject("title", "Dashboard");

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
