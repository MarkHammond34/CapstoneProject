package edu.ben.controller;

import java.util.List;

import edu.ben.model.Listing;
import edu.ben.model.Notification;
import edu.ben.model.SearchHistory;
import edu.ben.model.User;
import edu.ben.service.ListingBidService;
import edu.ben.service.NotificationService;
import edu.ben.service.SearchHistoryService;
import edu.ben.util.Email;
import edu.ben.util.ListingRunner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.ben.service.ListingService;

import javax.servlet.http.HttpServletRequest;

@Controller
@Transactional
public class HomeController extends BaseController {

    @Autowired
    ListingService listingService;

    @Autowired
    ListingBidService listingBidService;

    @Autowired
    NotificationService notificationService;

    @Autowired
    SearchHistoryService searchHistoryService;

    /*
    @Autowired
    FaqService faqService;
    */

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView home(HttpServletRequest request) {
        ModelAndView model = new ModelAndView("index");

        List<Listing> recent = listingService.getRecentListings();
        model.addObject("recentListings", recent);

        List<Listing> endingSoon = listingService.getRecentListings();
        model.addObject("endingSoonListings", endingSoon);

        List<Listing> trending = listingService.getListingsByBidCount();
        model.addObject("trendingListings", trending);

        model.addObject("relevantListings", null);

        User user = (User) request.getSession().getAttribute("user");

        ListingRunner.run();

        if (user != null) {

            List<Listing> relevantListings = listingService.getRelevantListingsByUserID(user.getUserID());
            if (relevantListings.size() > 3) {
                model.addObject("relevantListings", relevantListings);
            } else {
                model.addObject("relevantListings", null);
            }

            NotificationController.updateNotifications(request, notificationService);

        }

        setModel(model);
        return model;
    }

    @GetMapping("/contactUs")
    public String contactUs() {
        return "contactUs";
    }

    @PostMapping("/sendEmail")
    public String sendEmail(HttpServletRequest request) {
        String message = "";
        if (request.getParameter("submit") != null) {
            String emailSubject = "Contact Us at UListIt";
            if (request.getParameter("message") != null) {
                message += "Name:   " + request.getParameter("name") + "\n";
                message += "Phone:   " + request.getParameter("phone") + "\n";
                message += "Email:   " + request.getParameter("email") + "\n \n";
                message += request.getParameter("message");
            }
            try {
                Email.sendEmail(message, emailSubject, "ulistithelp@gmail.com");
                addSuccessMessage("Email sent successfully!");
            } catch (Exception me) {
                addErrorMessage("Error sending email!");
            }
        }
        setRequest(request);
        return "contactUs";
    }

}