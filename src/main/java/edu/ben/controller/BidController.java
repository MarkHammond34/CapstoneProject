package edu.ben.controller;

import edu.ben.model.User;
import edu.ben.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
public class BidController extends BaseController {

    @Autowired
    ListingService listingService;

    @Autowired
    ListingBidService listingBidService;

    @Autowired
    FavoriteService favoriteService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    UserService userService;

    @PostMapping("/bid")
    public String bid(@RequestParam("bidValue") int bidValue, @RequestParam int listingID,
                      HttpServletRequest request) {

        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            addWarningMessage("Login To Place A Bid");
            setRequest(request);
            return "login";
        }

        int results = listingBidService.placeBid(user.getUserID(), bidValue, listingService.getByListingID(listingID));

        if (results == -2) {
            addErrorMessage("Bid Most Be Larger Than Highest Bid");
        } else if (results == -1) {
            addErrorMessage("Sorry, you didn't get your bid in on time!");
        } else {
            addSuccessMessage("Congrats! You're the highest bidder!");
        }

        setRequest(request);
        return "redirect:" + request.getHeader("Referer");
    }

    @GetMapping("/cancelBid")
    public String bid(@RequestParam int l,
                      HttpServletRequest request) {

        System.out.println("Cancelling listing " + l);

        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            addErrorMessage("Login To Cancel A Bid");
            setRequest(request);
            return "redirect:/login";
        }

        int results = listingBidService.cancel(user, l);

        if (results == -1) {
            System.out.println("Listing Over");
            addErrorMessage("Listing Has Already Ended");
        } else {
            System.out.println("Bid Successfully Cancelled");
            addSuccessMessage("Bid Successfully Cancelled");
        }

        setRequest(request);
        return "redirect:" + request.getHeader("Referer");
    }
}
