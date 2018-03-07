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
    NotificationService notificationService;

    @Autowired
    ListingService listingService;

    @Autowired
    MessageService messageService;

    @Autowired
    private Environment environment;

    @PostMapping("/pick-up-confirm")
    public String pickUpConfirm(HttpServletRequest request, @RequestParam("pickUpID") int pickUpID,
                                @RequestParam("userID") int userID) {

        PickUp pickUp = pickUpService.getPickUpByPickUpID(pickUpID);

        if (pickUp == null) {
            addWarningMessage("Error Loading Page");
            return "redirect:/";
        }

        if (pickUp.getTransaction().getBuyer().getUserID() == userID) {
            pickUp.setBuyerAccept(1);

            if (pickUp.getSellerAccept() == 1) {
                // send seller notification that it was accepted
                notificationService.save(new Notification(pickUp.getTransaction().getSeller(),
                        pickUp.getTransaction().getListingID().getId(), "Pick Up Details Accepted",
                        "Pick up details have been accepted by "
                                + pickUp.getTransaction().getBuyer().getUsername() +
                                " for the listing you are buying.\nJust one last step!", 1, "PICKUP"));
            } else {
                // send seller notification to accept
                notificationService.save(new Notification(pickUp.getTransaction().getSeller(),
                        pickUp.getTransaction().getListingID().getId(), "Pick Up Details Accepted",
                        "Pick up details have been accepted by "
                                + pickUp.getTransaction().getBuyer().getUsername() +
                                " for the listing you are buying.\nNow it's your turn to accept.", 1, "PICKUP"));
            }

        } else if (pickUp.getTransaction().getSeller().getUserID() == userID) {
            pickUp.setSellerAccept(1);

            if (pickUp.getBuyerAccept() == 1) {
                // send buyer notification that it was accepted
                notificationService.save(new Notification(pickUp.getTransaction().getBuyer(),
                        pickUp.getTransaction().getListingID().getId(), "Pick Up Details Accepted",
                        "Pick up details have been accepted by "
                                + pickUp.getTransaction().getBuyer().getUsername() +
                                " for the listing you are selling.\nJust one last step!", 1, "PICKUP"));
            } else {
                // send buyer notification to accept
                notificationService.save(new Notification(pickUp.getTransaction().getBuyer(),
                        pickUp.getTransaction().getListingID().getId(), "Pick Up Details Accepted",
                        "Pick up details have been accepted by "
                                + pickUp.getTransaction().getBuyer().getUsername() +
                                " for the listing you are selling.\nNow it's your turn to accept.", 1, "PICKUP"));

            }
        }

        // Both Have Accepted
        if (pickUp.getBuyerAccept() == 1 && pickUp.getSellerAccept() == 1) {
            pickUp.setStatus("PICK UP ACCEPTED");
        } else {
            pickUp.setStatus("AWAITING ACCEPTANCE");
        }

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
            conversation = messageService.getConversationOrderByDateCreated(listing.getUser(), listing.getHighestBidder());

            // Get transaction
            Transaction transaction = transactionService.getTransactionsByListingID(listingID);
            if (transaction == null) {
                transactionService.createTransaction(new Transaction(listing, 0));
                transaction = transactionService.getTransactionsByListingID(listing.getId());
            }

            // Create default location
            Location location = new Location(String.valueOf(listing.getId()), Float.parseFloat(environment.getProperty("school.latitude")), Float.parseFloat(environment.getProperty("school.longitude")));
            locationService.save(location);
            location = locationService.getByName(String.valueOf(listing.getId()));

            // Create new pickup with default location
            pickUp = new PickUp(transaction, location, conversation);
            pickUp.setStatus("CREATED");
            pickUpService.save(pickUp);
            pickUp = pickUpService.getPickUpByListingID(listing.getId());
            pickUp.getLocation().setName("TBD");

            // Change Location Name Back To Default
            location.setName("TBD");
            locationService.update(location);

            // If seller goes to page first, add appropriate message and send seller notification
            if (transaction.getBuyer().getUserID() == user.getUserID()) {
                addWarningMessage("Seller has not set a pick up date, time, or location yet. Check back in a little bit.");
                notificationService.save(new Notification(transaction.getSeller(), transaction.getListingID().getId(), "Pick Up Details Created",
                        "Pick up details have been created for the listing you are selling.", 1, "PICKUP"));

                // If buyer goes to page first, add appropriate message and send buyer notification
            } else if (transaction.getSeller().getUserID() == user.getUserID()) {
                addWarningMessage("Set the pick up date, time, and location.");
                notificationService.save(new Notification(transaction.getBuyer(), transaction.getListingID().getId(), "Pick Up Details Created",
                        "Pick up details have been created for the listing you are buying.", 1, "PICKUP"));

                // Fail safe for a none authorized user trying to get to the page
            } else {
                addErrorMessage("Access Denied");
                setRequest(request);
                return "redirect:/";
            }

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
        setRequest(request);
        return "review-pick-up";
    }

    @PostMapping("/pick-up-edit")
    public String pickUpEdit(HttpServletRequest request, @RequestParam("pickUpID") int pickUpID,
                             @RequestParam("newName") String newName,
                             @RequestParam("newDate") String newDate, @RequestParam("newTime") String newTime,
                             @RequestParam("newPosition") String newPosition) {

        PickUp pickUp = pickUpService.getPickUpByPickUpID(pickUpID);

        if (pickUp == null) {
            addWarningMessage("Error Loading Pick Up Details");
            return "redirect:/" + request.getHeader("Referer");
        }

        // If new was edited
        if (!newName.equals("")) {
            Location location = pickUp.getLocation();
            location.setName(newName);
            locationService.update(location);
        }

        if (!newPosition.equals("")) {
            int commaIndex = newPosition.indexOf(',');

            Location location = pickUp.getLocation();

            location.setLatitude(Float.parseFloat(newPosition.substring(1, commaIndex)));
            location.setLongitude(Float.parseFloat(newPosition.substring(commaIndex + 2, (newPosition.length() - 1))));

            locationService.update(location);
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

        // Notify buyer that the pick up has been modified
        notificationService.save(new Notification(pickUp.getTransaction().getBuyer(), pickUp.getTransaction().getListingID().getId(), "Pick Up Details Edited",
                "Pick up details have been edited for the listing " + pickUp.getTransaction().getListingID().getName() +
                        ".", 1, "PICKUP"));

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
    public String sendPickUpMessage(HttpServletRequest request, @RequestParam("pickUpID") int pickUpID,
                                    @RequestParam("message") String message) {

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
