package edu.ben.controller;

import java.util.List;

import edu.ben.model.Listing;
import edu.ben.model.Notification;
import edu.ben.model.User;
import edu.ben.service.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.ben.service.ListingService;

import javax.servlet.http.HttpServletRequest;

@Controller
public class HomeController extends BaseController {

    @Autowired
    ListingService listingService;

    @Autowired
    NotificationService notificationService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView home(HttpServletRequest request) {
        ModelAndView model = new ModelAndView("index");

        List<Listing> recent = listingService.getRecentListings();
        model.addObject("recentListings", recent);

        List<Listing> endingSoon = listingService.getRecentListings();
        model.addObject("endingSoonListings", endingSoon);

        List<Listing> trending = listingService.getListingsByBidCount();
        model.addObject("trendingListings", trending);

        User user = (User) request.getSession().getAttribute("user");

        if (user != null) {
            List<Notification> notifications = notificationService.getActiveByUserID(user.getUserID());
            if (notifications.size() == 0) {
                request.getSession().setAttribute("notifications", null);
            } else {
                request.getSession().setAttribute("notifications", notifications);
            }
        } else {
            request.getSession().setAttribute("notifications", null);
        }

        setRequest(request);
        return model;
    }

    @GetMapping("/dismiss")
    public String dismiss(int n, HttpServletRequest request) {

        notificationService.deactivate(n);

        User user = (User) request.getSession().getAttribute("user");

        setRequest(request);
        return "redirect:" + request.getHeader("Referer");
    }
}