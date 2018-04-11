package edu.ben.controller;

import edu.ben.model.*;
import edu.ben.service.*;
import edu.ben.util.Email;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

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

    @Autowired
    LocationService locationService;

    @Autowired
    ChecklistService checklistService;

    @Autowired
    Environment environment;

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin(HttpServletRequest request) {
        List<User> recentUsers = userService.getRecentUsers();
        List<User> getAllMembers = userService.getAllUsers();
        List<Listing> recentListings = listingService.getRecentListings();
        ArrayList<String> status = new ArrayList<>();

        for (int i = 0; i < recentUsers.size(); i++) {
            if (recentUsers.get(i).getAdminLevel() > 0) {
                status.add("Admin");
            } else {
                status.add("Customer");
            }
        }
        request.getSession().setAttribute("recentUsers", recentUsers);
        request.getSession().setAttribute("recentListings", recentListings);
        request.getSession().setAttribute("members", getAllMembers);
        request.getSession().setAttribute("status", status);

        System.out.println("Member Size: " + getAllMembers.size());
        return "adminPage";
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

    @RequestMapping(value = "adminUnban", method = RequestMethod.POST)
    public String adminUnban(HttpServletRequest request) {
        User usr = userService.findBySchoolEmail(request.getParameter("ban"));
        userService.unbanByUsername(usr.getUsername());
        return "redirect:adminUser";
    }

    @RequestMapping(value = "adminBan", method = RequestMethod.POST)
    public String adminBan(HttpServletRequest request) {
        User usr = userService.findBySchoolEmail(request.getParameter("unban"));
        userService.banByUsername(usr.getUsername());
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

    @RequestMapping(value = "adminEditUser", method = RequestMethod.POST)
    public String adminEditUser(HttpServletRequest request) {
        User usr = userService.findBySchoolEmail(request.getParameter("schoolEmailEdit"));
        String firstName = request.getParameter("firstNameEdit");
        String lastName = request.getParameter("lastNameEdit");
        String username = request.getParameter("usernameEdit");
        String phoneNumber = request.getParameter("phoneNumberEdit");
        String email = request.getParameter("personalEmailEdit");
        String schoolEmail = request.getParameter("schoolEmailEdit");
        String password = request.getParameter("passwordEdit");

        Pattern pattern = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$",
                Pattern.CASE_INSENSITIVE);
        if (firstName.length() < 2 || firstName.length() > 30 || firstName.matches("[A-Za-z]")) {
            addErrorMessage("Incorrect value for first name");
        } else if (lastName.length() < 2 || lastName.length() > 30 || lastName.matches("[A-Za-z]")) {
            addErrorMessage("Incorrect value for first name");
        } else if (username.length() > 8) {
            addErrorMessage("Incorrect value for username");
        } else if (phoneNumber.length() != 10) {
            addErrorMessage("Incorrect value for phone number");
        } else if ((pattern.matcher(email).matches())) {
            addErrorMessage("Incorrect value for email");
        } else if ((pattern.matcher(schoolEmail).matches())) {
            addErrorMessage("Incorrect value for school email");
        } else if (password.length() > 8) {
            addErrorMessage("Incorrect value for password");
        } else {
            usr.setFirstName(firstName);
            usr.setLastName(lastName);
            usr.setUsername(username);
            usr.setEmail(email);
            usr.setSchoolEmail(schoolEmail);
            usr.setPassword(password);
            userService.saveOrUpdate(usr);
        }
        return "redirect:adminUser";
    }

    @RequestMapping(value = "adminListing", method = RequestMethod.GET)
    public String adminListing(HttpServletRequest request) {
        List<Listing> allListings = listingService.getRecentListings();
        request.getSession().setAttribute("allListings", allListings);
        return "admin/adminListings";

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

    @GetMapping("/adminLocations")
    public String locations(HttpServletRequest request) {

        User user = (User) request.getSession().getAttribute("user");

        if (user != null && user.getAdminLevel() < 1) {
            addErrorMessage("Access Denied");
            setRequest(request);
            return "login";
        }

        request.setAttribute("lat", environment.getProperty("school.latitude"));
        request.setAttribute("lng", environment.getProperty("school.longitude"));

        request.setAttribute("title", "Locations");

        List<Location> locations = locationService.getAllLocations();
        request.setAttribute("locations", locations);
        request.setAttribute("locationCount", locations.size());

        request.setAttribute("safeZones", locationService.getAllSafeZones());
        return "admin/admin-locations";
    }

    @PostMapping("/createSafeZone")
    public String createSafeZone(HttpServletRequest request, @RequestParam("name") String name,
                                 @RequestParam("position") String position) {

        User user = (User) request.getSession().getAttribute("user");

        if (user != null && user.getAdminLevel() < 1) {
            addErrorMessage("Access Denied");
            setRequest(request);
            return "login";
        }

        Location newLocation = new Location();
        newLocation.setName(name);
        newLocation.setSafeZone(1);
        newLocation.setActive(1);

        int commaIndex = position.indexOf(',');

        newLocation.setLatitude(Float.parseFloat(position.substring(1, commaIndex)));
        newLocation.setLongitude(Float.parseFloat(position.substring(commaIndex + 2, (position.length() - 1))));

        locationService.save(newLocation);

        addSuccessMessage("Safe Zone Created");
        setRequest(request);
        return "redirect:" + request.getHeader("Referer");
    }

    @PostMapping("/editSafeZone")
    public String editSafeZone(HttpServletRequest request, @RequestParam("locationID") int locationID,
                               @RequestParam("newName") String newName,
                               @RequestParam("newLat") float newLat, @RequestParam("newLng") float newLng) {

        User user = (User) request.getSession().getAttribute("user");

        if (user != null && user.getAdminLevel() < 1) {
            addErrorMessage("Access Denied");
            setRequest(request);
            return "login";
        }

        Location location = locationService.getByLocationID(locationID);

        if (!newName.equals("")) {
            location.setName(newName);
        }

        location.setLatitude(newLat);
        location.setLongitude(newLng);

        locationService.update(location);

        addSuccessMessage("Safe Zone Updated");
        setRequest(request);
        return "redirect:" + request.getHeader("Referer");
    }

    @PostMapping("/deleteSafeZone")
    public String editSafeZone(HttpServletRequest request, @RequestParam("locationID") int locationID) {

        User user = (User) request.getSession().getAttribute("user");

        if (user != null && user.getAdminLevel() < 1) {
            addErrorMessage("Access Denied");
            setRequest(request);
            return "login";
        }

        Location location = locationService.getByLocationID(locationID);
        location.setActive(0);
        locationService.update(location);

        addSuccessMessage("Safe Zone Updated");
        setRequest(request);
        return "redirect:" + request.getHeader("Referer");
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

    @GetMapping("/adminChecklist")
    public String checklist(HttpServletRequest request) {

        User user = (User) request.getSession().getAttribute("user");

        if (user != null && user.getAdminLevel() < 1) {
            addErrorMessage("Access Denied");
            setRequest(request);
            return "login";
        }

        request.setAttribute("title", "Checklist");
        request.setAttribute("defaultChecklist", checklistService.getAdminChecklist());
        return "admin/admin-checklist";

    }

    @PostMapping("/adminAddChecklistItem")
    public String addChecklistItem(HttpServletRequest request, @RequestParam("newItemName") String newItemName) {

        User user = (User) request.getSession().getAttribute("user");

        if (user != null && user.getAdminLevel() < 1) {
            addErrorMessage("Access Denied");
            setRequest(request);
            return "login";
        }

        // Get admin checklist
        Checklist checklist = checklistService.getAdminChecklist();

        if (checklist == null) {
            addErrorMessage("Error Loading Checklist");
            setRequest(request);
            return "redirect:" + request.getHeader("Referer");
        }

        ChecklistItem newItem = new ChecklistItem(checklist, newItemName);

        // Check if new item already exits
        for (ChecklistItem item : checklist.getItems()) {
            if (item.getName().equals(newItemName)) {
                addWarningMessage(newItemName + " Already Exists");
                setRequest(request);
                return "redirect:" + request.getHeader("Referer");
            }
        }

        checklistService.save(newItem);
        addSuccessMessage(newItemName + " Added To Default Checklist");
        setRequest(request);

        return "redirect:" + request.getHeader("Referer");

    }

    @PostMapping("/adminRemoveChecklistItem")
    public String addChecklistItem(HttpServletRequest request, @RequestParam("itemID") int itemID) {

        User user = (User) request.getSession().getAttribute("user");

        if (user != null && user.getAdminLevel() < 1) {
            addErrorMessage("Access Denied");
            setRequest(request);
            return "login";
        }

        // Get admin checklist
        Checklist checklist = checklistService.getAdminChecklist();

        if (checklist == null) {
            addErrorMessage("Error Loading Checklist");
            setRequest(request);
            return "redirect:" + request.getHeader("Referer");
        }

        ChecklistItem item = null;

        // Check if item exits
        for (ChecklistItem i : checklist.getItems()) {
            if (i.getItemID() == itemID) {
                item = i;
            }
        }

        if (item == null) {
            addErrorMessage("Removal Error: Item Does Not Exist");
            setRequest(request);
            return "redirect:" + request.getHeader("Referer");
        }

        checklistService.delete(item);

        addSuccessMessage(item.getName() + " Removed From Default Checklist");
        setRequest(request);

        return "redirect:" + request.getHeader("Referer");

    }

    @RequestMapping(value = "taskManager", method = RequestMethod.GET)
    public String taskPage(HttpServletRequest request) {
        return "task-manager";
    }
}
