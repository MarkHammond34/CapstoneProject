package edu.ben.controller;

import edu.ben.model.Dispute;
import edu.ben.model.Listing;
import edu.ben.model.Notification;
import edu.ben.model.User;
import edu.ben.service.DisputeService;
import edu.ben.service.ListingService;
import edu.ben.service.NotificationService;
import edu.ben.service.UserService;
import edu.ben.util.Email;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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

    @Autowired
    NotificationService notificationService;

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

    @PostMapping("/contactUser")
    public String contactUser(HttpServletRequest request, @RequestParam("receivingUser") String receivingUser, @RequestParam("disputeID") int disputeID, @RequestParam("subject") String subject, @RequestParam("message") String message) {

        User user = (User) request.getSession().getAttribute("user");

        if (user == null && user.getAdminLevel() < 1) {
            addWarningMessage("Login");
            setRequest(request);
            return "login";
        }

        Dispute dispute = disputeService.getByID(disputeID);
        if (dispute == null) {
            addErrorMessage("Invalid Dispute ID");
            setRequest(request);
            return "admin/admin-disputes";
        }

        if (receivingUser.equals("accuser")) {

            notificationService.save(new Notification(dispute.getAccuser(), dispute.getListing().getId(), "Dispute Follow Up", "A email has been sent to your school account from an administrator following up on a dispute you have filed.", 1));

            if (subject.equals("")) {
                Email.sendEmail(message, "Dispute (" + disputeID + ") Follow Up", dispute.getAccuser().getSchoolEmail());
            } else {
                Email.sendEmail(message, subject, dispute.getAccuser().getSchoolEmail());
            }

        } else {

            notificationService.save(new Notification(dispute.getDefender(), dispute.getListing().getId(), "Dispute Follow Up", "A email has been sent to your school account from an administrator following up on a dispute filed against you.", 1));

            if (subject == null) {
                Email.sendEmail(message, "Dispute (" + disputeID + ") Follow Up", dispute.getDefender().getSchoolEmail());
            } else {
                Email.sendEmail(message, subject, dispute.getDefender().getSchoolEmail());
            }

        }

        addSuccessMessage("Follow Up Email Sent");
        setRequest(request);
        return "redirect:/adminDisputes";

    }

    @PostMapping("/editDispute")
    public String editDispute(HttpServletRequest request, @RequestParam("disputeID") int disputeID, @RequestParam("newComplaint") String newComplaint, @RequestParam("newStatus") String newStatus) {

        User user = (User) request.getSession().getAttribute("user");

        if (user == null && user.getAdminLevel() < 1) {
            addWarningMessage("Login");
            setRequest(request);
            return "login";
        }

        Dispute dispute = disputeService.getByID(disputeID);
        if (dispute == null) {
            addErrorMessage("Invalid Dispute ID");
            setRequest(request);
            return "admin/admin-disputes";
        }

        dispute.setComplaint(newComplaint);
        dispute.setStatus(newStatus);

        disputeService.update(dispute);

        addSuccessMessage("Follow Up Email Sent");
        setRequest(request);
        return "redirect:/adminDisputes";
    }
}
