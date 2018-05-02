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

    @RequestMapping(value = "/relevantListing", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody
    String showRelevantRecommendations(HttpServletRequest request) {

        User user = (User) request.getSession().getAttribute("user");

        Listing recentListing = listingService.getRecentListingWithOfferOrBidByUserID(user.getUserID());
        Listing relevantListing = (Listing) listingService.getRelevantListingsFromRecentPurchaseByUserID(user.getUserID(), recentListing.getCategory()).get(0);

        JsonObject json = new JsonObject();

        json.addProperty("listingName", relevantListing.getName());
        json.addProperty("listingDescription", relevantListing.getDescription());
        json.addProperty("listingPrice", String.valueOf(relevantListing.getPrice()));
        json.addProperty("listingCategory", relevantListing.getCategory());

        return json.toString();
    }

    @RequestMapping(value = "/offerDetails", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody
    String showOfferDetails(HttpServletRequest request, @RequestParam("offerId") int offerid) {

        User user = (User) request.getSession().getAttribute("user");
        Offer offer = offerService.getOfferById(offerid);

        JsonObject json = new JsonObject();

        json.addProperty("offerId", offer.getOfferID());
        json.addProperty("offerAmount", offer.getOfferAmount());
        json.addProperty("offerMessage", String.valueOf(offer.getOfferMessage()));
        json.addProperty("offerMaker", offer.getOfferMaker().getUserID());
        json.addProperty("offerReceiver", offer.getOfferReceiver().getUserID());
        json.addProperty("offerStatus", offer.getStatus());
        json.addProperty("offerActive", offer.getActive());

        return json.toString();
    }

    @RequestMapping(value = "cancelAuction", method = RequestMethod.POST, produces = "application/json")
    public @ResponseBody
    boolean cancelAuctionAjax(HttpServletRequest request, @RequestParam("listing") int id) {

        User user = (User) request.getSession().getAttribute("user");

        Listing listing = listingService.getByListingID(id);

        try {
            System.out.println("trying");
            if (listing == null) {
                System.out.println("checking");
                if (listing.getBidCount() > 0) {
                    return false;
                }
                System.out.println("setting");
                listing.setActive(0);
                listing.setEnded(1);
                listingService.saveOrUpdate(listing);

                return true;

            } else {
                return false;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

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
