package edu.ben.controller;

import edu.ben.model.Listing;
import edu.ben.model.User;
import edu.ben.service.ListingService;
import edu.ben.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import sun.misc.Request;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class AdminController {
    @Autowired
    UserService userService;

    @Autowired
    ListingService listingService;

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin(HttpServletRequest request){
        List<User> recentUsers = userService.getRecentUsers();
        List<Listing> recentListings = listingService.getRecentListings();
        request.getSession().setAttribute("recentUsers", recentUsers);
        request.getSession().setAttribute("recentListings", recentListings);
        return "admin/adminPage";
    }
}
