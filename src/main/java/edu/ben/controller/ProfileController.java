package edu.ben.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import edu.ben.model.Listing;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import edu.ben.model.User;
import edu.ben.service.ListingService;
import edu.ben.service.UserService;

@Controller
public class ProfileController extends BaseController {
    @Autowired
    UserService userService;

    @Autowired
    ListingService listingService;

    @RequestMapping(value = "/viewProfile", method = RequestMethod.GET)
    public String viewProfile(HttpServletRequest request) {
        User session = (User) request.getSession().getAttribute("user");

        List<Listing> userListings = listingService.getAllListingsByUserID(session.getUserID());

        request.setAttribute("user", session);
        request.setAttribute("userListings", userListings);

        return "profile-page";
    }

    @RequestMapping(value = "/viewUserListings", method = RequestMethod.GET)
    public String viewUserListing(HttpServletRequest request) {
        User session = (User) request.getSession().getAttribute("user");

        List<Listing> userListings = listingService.getAllListingsByUserID(session.getUserID());

        List<Listing> listingsWon = listingService.getListingsWon(session.getUserID());
        List<Listing> listingsLost = listingService.getListingsLost(session.getUserID());
        List<Listing> listingsActive = listingService.getListingsInProgressUserBidOn(session.getUserID());

        request.setAttribute("user", session);
        request.setAttribute("userListings", userListings);

        request.setAttribute("listingsWon", listingsWon);
        if (listingsWon != null) {
            request.setAttribute("wonCount", listingsWon.size());
        } else {
            request.setAttribute("wonCount", 0);
        }

        request.setAttribute("listingsActive", listingsActive);
        if (listingsActive != null) {
            request.setAttribute("activeCount", listingsActive.size());
        } else {
            request.setAttribute("activeCount", 0);
        }

        request.setAttribute("listingsLost", listingsLost);
        if (listingsLost != null) {
            request.setAttribute("lostCount", listingsLost.size());
        } else {
            request.setAttribute("lostCount", 0);
        }

        return "listing-profile";
    }
    
    @RequestMapping(value="/editListing", method=RequestMethod.POST)
    public String editListing(@RequestParam("listing") int id, @RequestParam("price") double price) {
    	
    	Listing listing = listingService.getByListingID(id);
    	listing.setPrice(price);
    	listingService.saveOrUpdate(listing);
    	addSuccessMessage("Price successfully updated!");
    	
    	return "redirect:/viewProfile";
    }

}