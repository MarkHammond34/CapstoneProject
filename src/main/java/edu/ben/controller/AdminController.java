package edu.ben.controller;

import edu.ben.model.Listing;
import edu.ben.model.User;
import edu.ben.service.ListingService;
import edu.ben.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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

    @RequestMapping(value="/AdminDashboard", method= RequestMethod.GET)
    public ModelAndView adminPage(HttpServletRequest req, Model m){
        ModelAndView model;
        User check = (User) req.getSession().getAttribute("user");
        if(check == null || check.getAdminLevel() == 0){
            model = new ModelAndView("index");
            return model;
        }else{
            model = new ModelAndView("admin/adminDashboard");
            List<User> recentUsers = userService.getRecentUsers();
           // List<Listing> recentListings = listingService.getRecentListings();

            req.getSession().setAttribute("recentUsers",recentUsers);
           // req.getSession().setAttribute("recentListings",recentListings);
            return model;
        }

    }

    @RequestMapping(value="/AdminUsers", method= RequestMethod.GET)
    public ModelAndView adminUserPage(HttpServletRequest req, Model m){
        ModelAndView model;
        User check = (User) req.getSession().getAttribute("user");
        if(check == null || check.getAdminLevel() == 0){
            model = new ModelAndView("index");
            return model;
        }else{
            model = new ModelAndView("admin/adminDashboard");
            List<User> allUsers = userService.getAllUsers();
            req.getSession().setAttribute("allUsers",allUsers);
            return model;
        }
    }


}
