package edu.ben.controller;

import edu.ben.model.Listing;
import edu.ben.model.User;
import edu.ben.service.ListingService;
import edu.ben.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class AdminController extends BaseController {

    /**
     * @Autowired private PasswordEncoder passwordEncoder;
     */

    @Autowired
    UserService userService;
    ListingService listingService;

    @PostMapping("/AdminPage")
    public String adminPageGet(HttpServletRequest req, Model m){
        User check = (User) req.getSession().getAttribute("user");
        if(check == null){
            return "redirect:/index";
        }else{
            List<User> recentUsers = userService.getRecentUsers();
            List<Listing> recentListings = listingService.getRecentListings();
            req.setAttribute("recentUsers",recentUsers);
            req.setAttribute("recentListings",recentListings);
            return "redirect:/adminIndex";
        }

    }

}
