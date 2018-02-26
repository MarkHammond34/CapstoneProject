package edu.ben.controller;

import edu.ben.model.Dispute;
import edu.ben.model.Listing;
import edu.ben.model.User;
import edu.ben.service.DisputeService;
import edu.ben.service.ListingService;
import edu.ben.service.UserService;
import edu.ben.util.Email;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class AdminController extends BaseController {

    @Autowired
    UserService userService;

    @Autowired
    ListingService listingService;

    @Autowired
    DisputeService disputeService;

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin(HttpServletRequest request) {
        List<User> recentUsers = userService.getRecentUsers();
        List<Listing> recentListings = listingService.getRecentListings();
        request.getSession().setAttribute("recentUsers", recentUsers);
        request.getSession().setAttribute("recentListings", recentListings);
        return "admin/adminPage";
    }

    @RequestMapping(value = "adminUser", method = RequestMethod.GET)
    public String adminUser(HttpServletRequest request) {
        List<User> allUsers = userService.getAllUsers();
        request.getSession().setAttribute("allUsers", allUsers);
        return "admin/adminUserPage";
    }

    @RequestMapping(value = "adminUnlock", method = RequestMethod.POST)
    public String adminUnlock(HttpServletRequest request) {
        User usr = userService.findBySchoolEmail(request.getParameter("lock"));
        userService.unlockByUsername(usr.getUsername());
        return "redirect:adminUser";
    }

    @RequestMapping(value = "adminLock", method = RequestMethod.POST)
    public String adminLock(HttpServletRequest request) {
        User usr = userService.findBySchoolEmail(request.getParameter("unlock"));
        userService.lockByUsername(usr.getUsername());
        return "redirect:adminUser";
    }

    @RequestMapping(value = "adminPasswordReset", method = RequestMethod.POST)
    public String adminPasswordReset(HttpServletRequest request) {
        System.out.println(request.getParameter("email"));
        User usr = userService.findBySchoolEmail(request.getParameter("email"));
        Email.resetPassword(usr.getSchoolEmail());
        userService.lockByUsername(usr.getUsername());
        return "redirect:adminUser";
    }

    @RequestMapping(value = "adminDeleteUser", method = RequestMethod.POST)
    public String adminDelete(HttpServletRequest request) {
        User usr = userService.findBySchoolEmail(request.getParameter("delete"));
        userService.deleteUser(usr.getUserID());
        return "redirect:adminUser";
    }

    @RequestMapping(value = "adminCreateUser", method = RequestMethod.POST)
    public String adminCreateUser(HttpServletRequest request) {
        User user = new User();
        user.setFirstName(request.getParameter("firstName"));
        user.setLastName(request.getParameter("lastName"));
        user.setUsername(request.getParameter("username"));
        user.setEmail(request.getParameter("personalEmail"));
        user.setSchoolEmail(request.getParameter("benedictineEmail"));
        user.setPassword(request.getParameter("password"));
        if (request.getParameter("accountType") == "Admin") {
            user.setAdmin(1);
        } else {
            user.setAdmin(0);
        }
        userService.saveOrUpdate(user);
        return "redirect:adminUser";
    }

    @GetMapping("/adminDisputes")
    public String disputes(HttpServletRequest request) {

        User user = (User) request.getSession().getAttribute("user");

        if (user != null && user.getAdminLevel() < 1) {
            addErrorMessage("Access Denied");
            setRequest(request);
            return "login";
        }

        request.setAttribute("title", "Disputes");
        request.setAttribute("disputes", disputeService.getAllActive());
        return "admin/admin-disputes";
    }
}
