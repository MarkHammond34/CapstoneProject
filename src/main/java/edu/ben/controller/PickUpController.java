package edu.ben.controller;

import edu.ben.model.*;
import edu.ben.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

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
    public String pickUpCreate(HttpServletRequest request, @RequestParam("listingID") int listingID) {

        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            addErrorMessage("Login To Create A Pick Up");
            setRequest(request);
            return "login";
        }

        PickUp pickUp = pickUpService.getPickUpByListingID(listingID);

        // Creating a new pickup
        if (pickUp == null) {

            Listing listing = listingService.getByListingID(listingID);

            // Create new conversation
            Conversation conversation = new Conversation(listing.getUser(), listing.getHighestBidder());
            messageService.createConversation(conversation);

            // Get transaction
            Transaction transaction = transactionService.getTransactionsByListingID(listingID);
            if (transaction == null) {
                transactionService.createTransaction(new Transaction(listing, 0));
            }

            // Create default location
            Location location = new Location("N/A", Float.parseFloat(environment.getProperty("school.latitude")), Float.parseFloat(environment.getProperty("school.longitude")));
            locationService.save(location);

            // Create new pickup with default location
            pickUp = new PickUp(transaction, location, conversation);
            pickUp.setStatus("CREATED");
            pickUpService.save(pickUp);

            // If pickup exists
        } else {

            if (pickUp.getStatus().equals("CREATED")) {
                pickUp.setStatus("IN REVIEW");
            }
            pickUpService.update(pickUp);

        }

        request.setAttribute("pickUp", pickUp);

        request.setAttribute("latitude", environment.getProperty("school.latitude"));
        request.setAttribute("longitude", environment.getProperty("school.longitude"));
        request.setAttribute("title", "Pick Up Review");
        return "review-pick-up";
    }

    @PostMapping("/pick-up-edit")
    public String pickUpEdit(HttpServletRequest request, @RequestParam("pickUpID") int pickUpID, @RequestParam("newName") String newName,
                             @RequestParam("newDate") String newDate, @RequestParam("newTime") String newTime, @RequestParam("newPosition") String newPosition) {

        PickUp pickUp = pickUpService.getPickUpByPickUpID(pickUpID);

        if (pickUp == null) {
            addWarningMessage("Seller Has Not Yet Created A Pick Up");
            // FIX
            return "redirect:/";
        }

        // If new was edited
        if (!newName.equals("")) {
            pickUp.getLocation().setName(newName);
        }

        if (!newPosition.equals("")) {
            int commaIndex = newPosition.indexOf(',');

            pickUp.getLocation().setLatitude(Float.parseFloat(newPosition.substring(1, commaIndex)));
            pickUp.getLocation().setLongitude(Float.parseFloat(newPosition.substring(commaIndex + 2, (newPosition.length() - 1))));
        }

        // If date and time was edited
        if (!newDate.equals("") && !newTime.equals("")) {
            try {

                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                pickUp.setPickUpTimestamp(new Timestamp(dateFormat.parse(newDate + " " + newTime + ":00").getTime()));

            } catch (Exception e) {
                request.setAttribute("pickUp", pickUp);
                request.setAttribute("title", "Review Pick Up");

                request.setAttribute("latitude", environment.getProperty("school.latitude"));
                request.setAttribute("longitude", environment.getProperty("school.longitude"));

                addErrorMessage("Date & Time Error");
                setRequest(request);
                return "review-pick-up";
            }

        } else if (!newDate.equals("") && newTime.equals("")) {
            try {

                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String oldTime = pickUp.getPickUpTimestamp().toString().substring(11, 19);
                pickUp.setPickUpTimestamp(new Timestamp(dateFormat.parse(newDate + " " + oldTime + ":00").getTime()));

            } catch (Exception e) {
                request.setAttribute("pickUp", pickUp);
                request.setAttribute("title", "Review Pick Up");

                request.setAttribute("latitude", environment.getProperty("school.latitude"));
                request.setAttribute("longitude", environment.getProperty("school.longitude"));

                addErrorMessage("Date Error");
                setRequest(request);
                return "review-pick-up";
            }

        } else if (newDate.equals("") && !newTime.equals("")) {
            try {

                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String oldDate = pickUp.getPickUpTimestamp().toString().substring(0, 10);
                pickUp.setPickUpTimestamp(new Timestamp(dateFormat.parse(oldDate + " " + newTime + ":00").getTime()));

            } catch (Exception e) {
                request.setAttribute("pickUp", pickUp);
                request.setAttribute("title", "Review Pick Up");

                request.setAttribute("latitude", environment.getProperty("school.latitude"));
                request.setAttribute("longitude", environment.getProperty("school.longitude"));

                addErrorMessage("Time Error");
                setRequest(request);
                return "review-pick-up";
            }
        }

        pickUpService.update(pickUp);

        request.setAttribute("pickUp", pickUp);
        request.setAttribute("title", "Review Pick Up");

        request.setAttribute("latitude", environment.getProperty("school.latitude"));
        request.setAttribute("longitude", environment.getProperty("school.longitude"));

        addSuccessMessage("Pick Up Updated");
        setRequest(request);
        return "review-pick-up";
    }

    @PostMapping("/sendPickUpMessage")
    public String sendPickUpMessage(HttpServletRequest request, @RequestParam("pickUpID") int pickUpID, @RequestParam("message") String message) {

        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            addErrorMessage("Login To Send A Message");
            setRequest(request);
            return "login";
        }

        PickUp pickUp = pickUpService.getPickUpByPickUpID(pickUpID);

        if (pickUp == null) {
            addErrorMessage("Error Loading Pick Up");
            setRequest(request);
            return "redirect:/";
        }

        // If user logged in is not the seller or buyer
        if (user.getUserID() != pickUp.getTransaction().getSeller().getUserID() && user.getUserID() != pickUp.getTransaction().getBuyer().getUserID()) {
            addErrorMessage("Access Denied");
            setRequest(request);
            return "redirect:/";
        }

        // Send message
        messageService.sendMessage(user, message, pickUp.getConversation());

        request.setAttribute("pickUp", pickUp);
        request.setAttribute("title", "Review Pick Up");

        request.setAttribute("latitude", environment.getProperty("school.latitude"));
        request.setAttribute("longitude", environment.getProperty("school.longitude"));

        return "review-pick-up";
    }
}
