package edu.ben.controller;

import com.google.zxing.BinaryBitmap;
import com.google.zxing.LuminanceSource;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.Result;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.common.HybridBinarizer;
import edu.ben.model.*;
import edu.ben.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import java.awt.image.BufferedImage;
import java.io.File;
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
    QRCodeKeyService qrCodeKeyService;

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
            return "redirect:" + request.getHeader("Referer");
        }

        // Send notifications once accepted
        if (pickUp.getTransaction().getBuyer().getUserID() == user.getUserID()) {
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

        } else if (pickUp.getTransaction().getSeller().getUserID() == user.getUserID()) {
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
            request.setAttribute("listingID", pickUp.getTransaction().getListingID().getId());
            setRequest(request);
            request.setAttribute("checkingOut", "true");
            return "redirect:/checkout";

        } else {

            pickUp.setStatus("AWAITING ACCEPTANCE");
            pickUpService.update(pickUp);

            request.setAttribute("title", "Pick Up Review");
            request.setAttribute("pickUp", pickUp);

            request.setAttribute("latitude", environment.getProperty("school.latitude"));
            request.setAttribute("longitude", environment.getProperty("school.longitude"));

            // If buyer is the user logged in
            if (pickUp.getTransaction().getBuyer().getUserID() == user.getUserID()) {
                addWarningMessage("Just Need The Seller To Accept");
            } else {
                addWarningMessage("Just Need The Buyer To Accept");
            }

            setRequest(request);
            return "redirect:" + request.getHeader("Referer");
        }
    }

    @RequestMapping(value = "/pick-up-review", method = {RequestMethod.GET, RequestMethod.POST})
    public String pickUpCreate(HttpServletRequest request) {

        // BUG
        if (request.getMethod().equals("GET")) {
            addWarningMessage("Pick Up Review: Access Denied");
            setRequest(request);
            return "redirect:/";
        }

        int listingID = Integer.parseInt(request.getParameter("listingID"));

        System.out.println(request.getMethod());

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

        // Set the warning message based off of who has and who has not accepted the pick up
        if (user.getUserID() == pickUp.getTransaction().getBuyer().getUserID() &&
                pickUp.getSellerAccept() == 1 && pickUp.getBuyerAccept() == 0) {
            addWarningMessage("Seller has accepted the pickup. Accept to continue.");

        } else if (user.getUserID() == pickUp.getTransaction().getBuyer().getUserID() &&
                pickUp.getSellerAccept() == 0 && pickUp.getBuyerAccept() == 1) {
            addWarningMessage("Seller has not yet accepted the pickup.");

        } else if (user.getUserID() == pickUp.getTransaction().getSeller().getUserID() &&
                pickUp.getSellerAccept() == 1 && pickUp.getBuyerAccept() == 0) {
            addWarningMessage("Buyer has accepted the pickup. Accept to continue.");

        } else if (user.getUserID() == pickUp.getTransaction().getSeller().getUserID() &&
                pickUp.getSellerAccept() == 0 && pickUp.getBuyerAccept() == 1) {
            addWarningMessage("Buyer has not yet accepted the pickup.");
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
            return "redirect:" + request.getHeader("Referer");

            // If buyer tries to edit after the pick up was accepted, return warning
        } else if (pickUp.getBuyerAccept() == 1 && pickUp.getSellerAccept() == 1) {
            addWarningMessage("Pick Up Already Accepted By Both Parties");
            addWarningMessage("* If you would like to change the pick up details, please contact the other party via school email.");
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

    // Seller
    @GetMapping("/qr-code")
    public String generateQrCode(HttpServletRequest request, @RequestParam("p") int pickUpID) {

        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            addErrorMessage("Login To Generate A Code");
            setRequest(request);
            return "login";
        }

        PickUp pickUp = pickUpService.getPickUpByPickUpID(pickUpID);

        if (pickUp == null) {
            addErrorMessage("Error Loading Pick Up");
            setRequest(request);
            return "redirect:/";
        }

        // Verify that user logged in is the seller
        if (user.getUserID() != pickUp.getTransaction().getSeller().getUserID()) {
            addErrorMessage("Access Denied");
            setRequest(request);
            return "redirect:" + request.getHeader("Referer");
        }

        QRCodeKey qrCodeKey = qrCodeKeyService.getByPickUpID(pickUpID);

        // If code does not already exist, create one
        if (qrCodeKey == null) {

            String key = generateQRKey(pickUp.getTransaction().getBuyer().getUserID(),
                    pickUp.getTransaction().getSeller().getUserID(), pickUp.getPickUpID());

            // Ensures key is unique
            while (qrCodeKeyService.exists(key)) {
                key = generateQRKey(pickUp.getTransaction().getBuyer().getUserID(),
                        pickUp.getTransaction().getSeller().getUserID(), pickUp.getPickUpID());
            }

            qrCodeKeyService.save(new QRCodeKey(key, pickUp));

            request.setAttribute("pickUp", pickUp);
            request.setAttribute("qrCodeKey", qrCodeKeyService.getByKey(key));
            return "pickup/view-qr-code";

        } else {

            request.setAttribute("pickUp", pickUp);
            request.setAttribute("qrCodeKey", qrCodeKey);
            return "pickup/view-qr-code";

        }
    }

    private String generateQRKey(int buyerID, int sellerID, int pickUpID) {
        String code = String.valueOf(pickUpID) + String.valueOf(buyerID) + String.valueOf(sellerID);
        for (int i = 0; i < 13; i++) {
            code += (int) (Math.random() * 10);
        }
        return code;
    }

    // Buyer
    @GetMapping("/scan-qr-code")
    public String scanQrCodeGet(HttpServletRequest request, @RequestParam("p") int pickUpID) {

        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            addErrorMessage("Login To Generate A Code");
            setRequest(request);
            return "login";
        }

        PickUp pickUp = pickUpService.getPickUpByPickUpID(pickUpID);

        // Verify the pick up exists
        if (pickUp == null) {
            addErrorMessage("Pick Up Has Not Been Created");
            setRequest(request);
            return "redirect:/";
        }

        // Verify that buyer accepted the pick up
        if (pickUp.getBuyerAccept() == 0) {
            addErrorMessage("Pick Up Has Not Been Accepted");
            setRequest(request);
            return "redirect:/";
        }

        // Verify that user logged in is the buyer
        if (user.getUserID() == pickUp.getTransaction().getBuyer().getUserID()) {
            addErrorMessage("Access Denied");
            setRequest(request);
            return "redirect:" + request.getHeader("Referer");
        }

        if (qrCodeKeyService.exists(pickUpID)) {
            addSuccessMessage("Scan The QR Code To Verify Your Pick Up");
        } else {
            addWarningMessage("Seller Has Not Created Opened The QR Code");
        }

        setRequest(request);
        return "pickup/scan-qr-code";
    }

    @GetMapping("/sample-scan")
    public String sampleScan() {
        return "pickup/scan-qr-code";
    }

    @GetMapping("/sample-code")
    public String sampleCode(HttpServletRequest request) {
        QRCodeKey key = new QRCodeKey();
        key.setKey("1234");
        request.setAttribute("qrCodeKey", key);
        return "pickup/view-qr-code";
    }

    @PostMapping("/verify-qr-code")
    public String verifyQrCode(HttpServletRequest request, @RequestParam("p") int pickUpID, @RequestParam("qrCodeImage") File qrCodeImage) {

        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            addErrorMessage("Login To Generate A Code");
            setRequest(request);
            return "login";
        }

        PickUp pickUp = pickUpService.getPickUpByPickUpID(pickUpID);

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

        // Verify that user logged in is the buyer
        if (user.getUserID() == pickUp.getTransaction().getBuyer().getUserID()) {
            addErrorMessage("Access Denied");
            setRequest(request);
            return "redirect:" + request.getHeader("Referer");
        }

        QRCodeKey key = qrCodeKeyService.getByPickUpID(pickUpID);

        // Verify key exists
        if (key == null) {
            addErrorMessage("QR Code Not Yet Created");
            setRequest(request);
            return "redirect:" + request.getHeader("Referer");
        }

        try {
            BufferedImage bufferedImage = ImageIO.read(qrCodeImage);
            LuminanceSource source = new BufferedImageLuminanceSource(bufferedImage);
            BinaryBitmap bitmap = new BinaryBitmap(new HybridBinarizer(source));

            Result result = new MultiFormatReader().decode(bitmap);

            System.out.println("Result: " + result.getText());

            // Get scanned code
            String scannedKey = result.getText();

            // Compare codes
            if (scannedKey.equals(key.getKey())) {
                // Set key to scanned and confirmed
                key.setStatus("SCANNED_CONFIRMED");
                qrCodeKeyService.update(key);

                // Set pickup to confirmed
                pickUp.setStatus("VERIFIED");
                pickUpService.update(pickUp);

                setRequest(request);
                return "redirect:/pick-up-confirmed";
            } else {
                // Return with error
                key.setStatus("SCANNED");
                addErrorMessage("Invalid Code");
                setRequest(request);
                return "redirect:" + request.getHeader("Referer");
            }
        } catch (Exception e) {
            // Returns with error if code couldn't be decoded
            addErrorMessage("Error Decoding QR Code, Try Again");
            setRequest(request);
            return "redirect:" + request.getHeader("Referer");
        }

    }

    @GetMapping("/pick-up-confirmed")
    public String pickUpConfirmed(HttpServletRequest request, @RequestParam("p") int pickUpID) {

        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            addErrorMessage("Login To Generate A Code");
            setRequest(request);
            return "login";
        }

        PickUp pickUp = pickUpService.getPickUpByPickUpID(pickUpID);

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

        // Verify that user logged in is the buyer
        if (user.getUserID() == pickUp.getTransaction().getBuyer().getUserID()) {
            addErrorMessage("Access Denied");
            setRequest(request);
            return "redirect:" + request.getHeader("Referer");
        }

        QRCodeKey key = qrCodeKeyService.getByPickUpID(pickUpID);

        // Verify key exists
        if (key == null) {
            addErrorMessage("QR Code Not Yet Created");
            setRequest(request);
            return "redirect:" + request.getHeader("Referer");
        }

        if (key.getStatus().equals("SCANNED_CONFIRMED")) {
            addSuccessMessage("Pick Up Confirmed");
            setRequest(request);
            return "pickup/pick-up-verified";
        } else {
            addWarningMessage("Pick Up Not Yet Confirmed");
            setRequest(request);
            return "redirect:" + request.getHeader("Referer");
        }
    }
}
