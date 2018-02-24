package edu.ben.controller;

import java.util.List;

import edu.ben.model.Listing;
import edu.ben.model.Notification;
import edu.ben.model.User;
import edu.ben.service.NotificationService;
import edu.ben.util.Email;
import edu.ben.util.ListingRunner;
import edu.ben.util.NotificationRunner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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

	// @Autowired
	// NotificationService notificationService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(HttpServletRequest request) {
		ModelAndView model = new ModelAndView("index");

		List<Listing> dailyBids = listingService.getAllDailyListings();
		model.addObject("dailyBids", dailyBids);

		List<Listing> weeklyBids = listingService.getAllWeeklyListings();
		model.addObject("weeklyBids", weeklyBids);

		List<Listing> weeklyPlusBids = listingService.getAllWeeklyPlusListings();
		model.addObject("weeklyPlusBids", weeklyPlusBids);

		List<Listing> fixedPrice = listingService.getAllFixedListings();
		model.addObject("fixedPrice", fixedPrice);

		List<Listing> recent = listingService.getRecentListings();
		model.addObject("recentListings", recent);

		List<Listing> endingSoon = listingService.getRecentListings();
		model.addObject("endingSoonListings", endingSoon);

		List<Listing> trending = listingService.getListingsByBidCount();
		model.addObject("trendingListings", trending);

		User user = (User) request.getSession().getAttribute("user");

		// ListingRunner.run();
		// NotificationRunner.run();
		//
		// if (user != null) {
		// List<Notification> notifications =
		// notificationService.getNotDismissedByUserID(user.getUserID());
		// if (notifications.size() == 0) {
		// request.getSession().setAttribute("notifications", null);
		// } else {
		// request.getSession().setAttribute("notifications", notifications);
		//
		// int count = 0;
		// for (Notification n : notifications) {
		// if (n.getViewed() == 0) {
		// count++;
		// }
		// }
		//
		// request.getSession().setAttribute("unviewedNotificationCount", count);
		// }
		// } else {
		// request.getSession().setAttribute("notifications", null);
		// }
		//
		// setRequest(request);
		return model;
	}

	@GetMapping("/dismiss")
	public void dismiss(int n) {
		// System.out.println("Notification " + n);
		// notificationService.dismiss(n);
	}

	@GetMapping("/markAsViewed")
	public void markAsViewed(HttpServletRequest request) {

		// notificationService.markAsViewed((List<Notification>)
		// request.getSession().getAttribute("notifications"));
		//
		// User user = (User) request.getSession().getAttribute("user");
		//
		// if (user != null) {
		// List<Notification> notifications =
		// notificationService.getNotDismissedByUserID(user.getUserID());
		// if (notifications.size() == 0) {
		// request.getSession().setAttribute("notifications", null);
		// } else {
		// request.getSession().setAttribute("notifications", notifications);
		//
		// int count = 0;
		// for (Notification n : notifications) {
		// if (n.getViewed() == 0) {
		// count++;
		// }
		// }
		//
		// request.getSession().setAttribute("unviewedNotificationCount", count);
		// }
		// } else {
		// request.getSession().setAttribute("notifications", null);
		// }
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