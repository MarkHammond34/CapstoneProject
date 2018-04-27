package edu.ben.controller;

import com.google.gson.JsonObject;
import edu.ben.model.*;
import edu.ben.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
            setModel(new ModelAndView("redirect:login"));
            return new ModelAndView("redirect:login");

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

    @RequestMapping(value = "/offerDetails", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody
    String showOfferDetails(HttpServletRequest request, @RequestParam("offerId") int offerid) {

        System.out.println("Offer id: " + offerid);
        User user = (User) request.getSession().getAttribute("user");
        Offer offer = offerService.getOfferById(offerid);

        JsonObject json = new JsonObject();

        json.addProperty("offer-id", offer.getOfferID());
        json.addProperty("offer-amount", offer.getOfferAmount());
        json.addProperty("offer-message", String.valueOf(offer.getOfferMessage()));
        json.addProperty("offer-maker", offer.getOfferMaker().getUserID());
        json.addProperty("offer-receiver", offer.getOfferReceiver().getUserID());
        json.addProperty("offer-status", offer.getStatus());
        json.addProperty("offer-active", offer.getActive());

        return json.toString();
    }

    @RequestMapping(value = "/pickUpDetails", method = RequestMethod.GET)
    public String showPickUpDetails(HttpServletRequest request, @RequestParam("pickupId") int pickupId) {

        System.out.println("Pickup id: " + pickupId);
        User user = (User) request.getSession().getAttribute("user");

        JsonObject json = new JsonObject();

        // Set json properties

        return json.toString();
    }

    @RequestMapping(value = "/transactionDetails", method = RequestMethod.GET)
    public String showTransactionDetails() {

        JsonObject json = new JsonObject();

        // Set json properties

        return json.toString();
    }
}
