package edu.ben.controller;

import edu.ben.model.Dispute;
import edu.ben.model.Listing;
import edu.ben.model.Notification;
import edu.ben.model.User;
import edu.ben.service.DisputeService;
import edu.ben.service.ListingService;
import edu.ben.service.NotificationService;
import edu.ben.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Controller
public class DisputeController extends BaseController {

    @Autowired
    DisputeService disputeService;

    @Autowired
    NotificationService notificationService;

    @Autowired
    UserService userService;

    @Autowired
    ListingService listingService;

    @PostMapping("/dispute")
    public String fileDispute(HttpServletRequest request, @RequestParam("complaint") String complaint) {

        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            addWarningMessage("Please Login To File A Dispute");
            setRequest(request);
            return "login";

        } else {

            Listing disputeListing = (Listing) request.getSession().getAttribute("disputeListing");

            if (disputeListing == null) {

                addErrorMessage("Dispute Error, Try Again");
                setRequest(request);
                return request.getHeader("Referer");

            } else {

                Dispute dispute = new Dispute(disputeListing, user, disputeListing.getUser(), complaint);

                disputeService.save(dispute);

                // Send notification to accuser
                notificationService.save(new Notification(user, dispute.getListing().getId(), "Dispute Has Been Filed", "Dispute has been successfully filed.\n\nListing: " + dispute.getListing().getName() + "\nDispute: '" + dispute.getComplaint() + "'\nAn administrator will review the dispute and respond via within 48 hours.", new Timestamp(System.currentTimeMillis() + 120000), 1));

                // Send notification to defendant
                notificationService.save(new Notification(dispute.getDefender(), dispute.getListing().getId(), "Dispute Has Been Filed Against You", "Dispute has been filed against you.\n\nListing: " + dispute.getListing().getName() + "\nDispute: '" + dispute.getComplaint() + "'\nAn administrator will review the dispute and respond via within 48 hours.", new Timestamp(System.currentTimeMillis() + 120000), 1));

                // Send notification to admins
                List<User> disputeResolvingAdmins = userService.getDisputeResolvingAdmins();
                List<Notification> adminNotifications = new ArrayList<Notification>();

                for (User u : disputeResolvingAdmins) {
                    adminNotifications.add(new Notification(u, dispute.getListing().getId(), "New Dispute Has Been Filed", "New Dispute has been filed.\n\nListing: " + dispute.getListing().getName() + "\nAccuser: " + dispute.getAccuser().getFirstName() + " " + dispute.getAccuser().getLastName() +
                            "\nDispute: '" + dispute.getComplaint(), new Timestamp(System.currentTimeMillis() + 120000), 1));
                }

                notificationService.save(adminNotifications);

                addSuccessMessage("Dispute Successfully Filed. An Administrator Will Review Your Complaint.");
                return "redirect:/";
            }
        }
    }

    @GetMapping("/dispute")
    public String getDispute(HttpServletRequest request, int l) {
        try {

            request.getSession().setAttribute("disputeListing", listingService.getByListingID(l));

        } catch (IndexOutOfBoundsException e) {
            addErrorMessage("No Active Listings Under ID " + l);
            setRequest(request);
            return "redirect:/";
        }

        setRequest(request);
        return "file-dispute";
    }

}
