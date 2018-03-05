package edu.ben.controller;

import edu.ben.model.*;
import edu.ben.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
public class PickUpController extends BaseController {

    @Autowired
    TransactionService transactionService;

    @Autowired
    LocationService locationService;

    @Autowired
    PickUpService pickUpService;

    @Autowired
    UserService userService;

    @Autowired
    ListingService listingService;

    @Autowired
    MessageService messageService;

    @Autowired
    private Environment environment;

    @PostMapping("/pick-up-confirm")
    public String pickUpConfirm(HttpServletRequest request, @RequestParam("pickUpID") int pickUpID) {

        PickUp pickUp = pickUpService.getPickUpByPickUpID(pickUpID);

        if (pickUp == null) {
            addWarningMessage("Error Loading Page");
            return "redirect:/";
        }

        pickUp.setStatus("CONFIRMED");
        pickUpService.update(pickUp);

        request.setAttribute("pickUp", pickUp);
        request.setAttribute("title", "Checkout");

        return "checkout";
    }

    @PostMapping("/pick-up-review")
    public String pickUpReview(HttpServletRequest request, @RequestParam("pickUpID") int pickUpID) {

        PickUp pickUp = pickUpService.getPickUpByPickUpID(pickUpID);

        if (pickUp == null) {
            addWarningMessage("Seller Has Not Yet Created A Pick Up");
            // FIX
            return "redirect:/";
        }

        pickUp.setStatus("IN REVIEW");
        pickUpService.update(pickUp);

        request.setAttribute("pickUp", pickUp);
        request.setAttribute("title", "Review Pick Up");

        request.setAttribute("latitude", environment.getProperty("school.latitude"));
        request.setAttribute("longitude", environment.getProperty("school.longitude"));

        return "pick-up/review-pick-up";
    }

    @PostMapping("/pick-up-create")
    public String pickUpCreate(HttpServletRequest request, @RequestParam("listingID") int listingID) {

        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            addErrorMessage("Login To Create A Pick Up");
            setRequest(request);
            return "login";
        }

        PickUp pickUp = pickUpService.getPickUpByListingID(listingID);

        if (pickUp != null) {
            request.setAttribute("pickUp", pickUp);
        }

        Listing listing = listingService.getByListingID(listingID);

        // Create new conversation
        Conversation conversation = new Conversation(listing.getUser(), listing.getHighestBidder());
        messageService.createConversation(conversation);

        // Create new pickup with default location
        pickUp = new PickUp(transactionService.getTransactionsByListingID(listingID),
                new Location(Float.parseFloat(environment.getProperty("school.latitude")), Float.parseFloat(environment.getProperty("school.longitude")))
                , conversation);
        pickUpService.save(pickUp);
        request.setAttribute("pickUp", pickUp);

        request.setAttribute("latitude", environment.getProperty("school.latitude"));
        request.setAttribute("longitude", environment.getProperty("school.longitude"));
        request.setAttribute("title", "Create A Pick Up");
        return "pick-up/create-pick-up";
    }
}
