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
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

@SuppressWarnings("AppEngineForbiddenCode")
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

    @PostMapping("/pick-up-accept")
    public String pickUpConfirm(HttpServletRequest request, @RequestParam("pickUpID") int pickUpID) {

        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            addErrorMessage("Login To Accept A Pick Up");
            setRequest(request);
            return "login";
        }

        PickUp pickUp = pickUpService.getPickUpByPickUpID(pickUpID);

        if (pickUp == null) {
            addWarningMessage("Error Loading Page");
            setRequest(request);
            return "redirect:" + request.getHeader("Referer");
        }

        // Send notifications once accepted
        if (pickUp.getTransaction().getBuyer().getUserID() == user.getUserID()) {

            pickUp.setBuyerAccept(1);

            // send seller notification that it was accepted
            notificationService.save(new Notification(pickUp.getTransaction().getSeller(),
                    pickUp.getTransaction().getListingID().getId(), "Pick Up Details Accepted",
                    "Pick up details have been accepted by "
                            + pickUp.getTransaction().getBuyer().getUsername() +
                            " for the listing you are buying.\nJust one last step!", 1, "PICKUP"));

            pickUp.setStatus("ACCEPTED");

            pickUpService.update(pickUp);

            setRequest(request);
            return "redirect:/checkout?l=" + pickUp.getTransaction().getListingID().getId();

        } else {
            addWarningMessage("Access Denied");
            setRequest(request);
            return "redirect:" + request.getHeader("Referer");
        }
    }

    @GetMapping("/pick-up-review")
    public String pickUpCreate(HttpServletRequest request, @RequestParam("l") int listingID) {

        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            addErrorMessage("Login To Create A Pick Up");
            setRequest(request);
            return "login";
        }

        Transaction transaction = transactionService.getTransactionsByListingID(listingID);

        // Verify transaction was created
        if (transaction == null) {
            addErrorMessage("Error Loading Transaction");
            setRequest(request);
            return "redirect:" + request.getHeader("Referer");
        }

        // Verify user
        if (user.getUserID() != transaction.getBuyer().getUserID() && user.getUserID() != transaction.getSeller().getUserID()) {
            addWarningMessage("Access Denied");
            setRequest(request);
            return "redirect:" + request.getHeader("Referer");
        }

        PickUp pickUp = pickUpService.getPickUpByListingID(listingID);

        // Creating a new pickup
        if (pickUp == null) {

            Listing listing = listingService.getByListingID(listingID);

            // Create new conversation
            Conversation conversation = new Conversation(listing.getUser(), listing.getHighestBidder());
            int conversationID = messageService.createConversation(conversation);
            conversation = messageService.getConversationByID(conversationID);

            // Create default location
            Location location = new Location("TBD",
                    Float.parseFloat(environment.getProperty("school.latitude")), Float.parseFloat(environment.getProperty("school.longitude")));
            int locationID = locationService.save(location);
            location = locationService.getByLocationID(locationID);

            // Create new pickup with default location
            pickUp = new PickUp(transaction, location, conversation);
            pickUp.setStatus("CREATED");
            pickUpService.save(pickUp);
            pickUp = pickUpService.getPickUpByListingID(listing.getId());

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

        if (user.getUserID() == pickUp.getTransaction().getSeller().getUserID() &&
                pickUp.getStatus().equals("PICK UP MISSED")) {
            addWarningMessage("Pickup time missed! Set a new date and time to continue.");

        } else if (user.getUserID() == pickUp.getTransaction().getBuyer().getUserID() &&
                pickUp.getStatus().equals("PICK UP MISSED")) {
            addWarningMessage("Pickup time missed! Accept the new date and time to continue.");
        }

        request.setAttribute("pickUp", pickUp);

        request.setAttribute("latitude", environment.getProperty("school.latitude"));
        request.setAttribute("longitude", environment.getProperty("school.longitude"));
        request.setAttribute("title", "Pick Up Review");
        setRequest(request);
        return "pickup/review-pick-up";
    }

    @PostMapping("/pick-up-edit")
    public String pickUpEdit(HttpServletRequest request, @RequestParam("pickUpID") int pickUpID,
                             @RequestParam("newName") String newName,
                             @RequestParam("newDate") String newDate, @RequestParam("newTime") String newTime,
                             @RequestParam("newPosition") String newPosition) {

        PickUp pickUp = pickUpService.getPickUpByPickUpID(pickUpID);

        if (pickUp == null) {
            addWarningMessage("Error Loading Pick Up Details");
            setRequest(request);
            return "redirect:" + request.getHeader("Referer");

            // If buyer tries to edit after the pick up was accepted, return warning
        } else if (pickUp.getBuyerAccept() == 1) {
            addWarningMessage("Pick Up Already Accepted By The Buyer");
            addWarningMessage("* If you would like to change the pick up details, please contact the other party via school email (" +
                    pickUp.getTransaction().getBuyer().getSchoolEmail() + ").");
            return "redirect:" + request.getHeader("Referer");
        } else {

            // If new was edited
            if (!newName.equals("")) {
                Location location = pickUp.getLocation();
                location.setName(newName);
                locationService.update(location);
            }

            // If position was edited
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
                    return "redirect:" + request.getHeader("Referer");
                }

                // If only date was edited
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
                    return "redirect:" + request.getHeader("Referer");
                }

                // If only time was edited
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
                    return "redirect:" + request.getHeader("Referer");
                }
            }

            // If buyer already accepted, unaccept and notify them.
            if (pickUp.getBuyerAccept() == 1) {

                // Notify buyer that the pick up has been modified
                notificationService.save(new Notification(pickUp.getTransaction().getBuyer(), pickUp.getTransaction().getListingID().getId(),
                        "Reaccept Pick Up", "Pick up details have been edited for the listing " +
                        pickUp.getTransaction().getListingID().getName() +
                        ".\nTo continue with the pick up, please reaccept.", 1, "PICKUP"));

                pickUp.setBuyerAccept(0);

            } else {

                // Notify buyer that the pick up has been modified
                notificationService.save(new Notification(pickUp.getTransaction().getBuyer(), pickUp.getTransaction().getListingID().getId(),
                        "Pick Up Details Edited", "Pick up details have been edited for the listing " +
                        pickUp.getTransaction().getListingID().getName() +
                        ".", 1, "PICKUP"));
            }

            pickUpService.update(pickUp);

            request.setAttribute("pickUp", pickUp);
            request.setAttribute("title", "Review Pick Up");

            request.setAttribute("latitude", environment.getProperty("school.latitude"));
            request.setAttribute("longitude", environment.getProperty("school.longitude"));

            addSuccessMessage("Pick Up Updated");
            setRequest(request);
            return "redirect:" + request.getHeader("Referer");
        }
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
            return "redirect:" + request.getHeader("Referer");
        }

        // Send message
        messageService.sendMessage(user, message, pickUp.getConversation());

        request.setAttribute("pickUp", pickUp);
        request.setAttribute("title", "Review Pick Up");

        request.setAttribute("latitude", environment.getProperty("school.latitude"));
        request.setAttribute("longitude", environment.getProperty("school.longitude"));

        return "redirect:" + request.getHeader("Referer");
    }


    @GetMapping("/pick-up-confirm")
    public String pickUpConfirmed(HttpServletRequest request, @RequestParam("l") int listingID) {

        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            addErrorMessage("Login To Generate A Code");
            setRequest(request);
            return "login";
        }

        PickUp pickUp = pickUpService.getPickUpByListingID(listingID);

        if (pickUp == null) {
            addErrorMessage("Error Loading Pick Up");
            setRequest(request);
            return "redirect:/";
        }

        // Verify that buyer accepted the pick up
        if (pickUp.getBuyerAccept() == 0) {
            addErrorMessage("Pick Up Has Not Been Accepted");
            setRequest(request);
            return "redirect:/";
        }

        // Verify pick up as buyer
        if (user.getUserID() == pickUp.getTransaction().getBuyer().getUserID()) {

            pickUp.setBuyerVerified(1);

            // Pick up fully verified
            if (pickUp.getSellerVerified() == 1) {

                // PROCESS PAYPAL TRANSACTION

                // END TRANSACTION
                Transaction transaction = pickUp.getTransaction();
                transaction.setCompleted(1);
                transactionService.saveOrUpdate(transaction);

                // END PICK UP
                pickUp.setStatus("COMPLETED");

            }

            addSuccessMessage("Pick Up Verified");

            // Verify pick up as seller
        } else if (user.getUserID() == pickUp.getTransaction().getSeller().getUserID()) {

            pickUp.setSellerVerified(1);

            // Pick up fully verified
            if (pickUp.getBuyerVerified() == 1) {

                // PROCESS PAYPAL TRANSACTION

                // END TRANSACTION
                Transaction transaction = pickUp.getTransaction();
                transaction.setCompleted(1);
                transactionService.saveOrUpdate(transaction);

                // END PICK UP
                pickUp.setStatus("COMPLETED");

            }

            addSuccessMessage("Pick Up Verified");

            // Unauthorized user
        } else {
            addErrorMessage("Access Denied");
        }

        pickUpService.update(pickUp);

        setRequest(request);
        return "redirect:" + request.getHeader("Referer");
    }

}