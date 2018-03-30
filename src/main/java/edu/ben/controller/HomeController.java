package edu.ben.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.ben.model.Checklist;
import edu.ben.model.Listing;
import edu.ben.model.User;
import edu.ben.service.ChecklistService;
import edu.ben.service.ListingBidService;
import edu.ben.service.ListingService;
import edu.ben.service.NotificationService;
import edu.ben.service.SearchHistoryService;
import edu.ben.util.Email;
import edu.ben.util.ListingRunner;

@Controller
public class HomeController extends BaseController {

	@Autowired
	ListingService listingService;

	@Autowired
	ListingBidService listingBidService;

	@Autowired
	NotificationService notificationService;

	@Autowired
	SearchHistoryService searchHistoryService;

	@Autowired
	ChecklistService checklistService;

	/*
	 * @Autowired FaqService faqService;
	 */

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(HttpServletRequest request) {
		ModelAndView model = new ModelAndView("index");

		model.addObject("recentListings", listingService.getRecentListings());

		model.addObject("endingSoonListings", listingService.getRecentListings());

		model.addObject("trendingListings", listingService.getListingsByBidCount());

		model.addObject("relevantListings", null);

		model.addObject("premiumListings", listingService.getPremiumListings());

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

            try {
                request.getSession().setAttribute("checklist", checklistService.getByUserIDAndType(user.getUserID(), "FRESHMAN"));
            } catch (Exception e) {
                request.getSession().setAttribute("checklist", null);
            }

            if (user.getGradeLevel().equals("Freshman") && user.getDateCreated().before(new Timestamp(System.currentTimeMillis() + 600000))
                    && checklistService.getByUserIDAndType(user.getUserID(), "FRESHMAN") == null) {
                request.setAttribute("newUser", true);
            }

        }

		setModel(model);
		return model;
	}

	@GetMapping("/contactUs")
	public String contactUs() {
		return "contactUs";
	}
	
	@GetMapping("/aboutUs")
	public String aboutUs() {
		return "aboutUs";
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
/*				addErrorMessage("Error sending email!");*/
				addSuccessMessage("Email sent successfully!");
			}
		}
		setRequest(request);
		return "index";
	}
	
	@PostMapping("/reportListingEmail")
	public String reportListingEmail(HttpServletRequest request) {
		String message = "";
		if (request.getParameter("submit") != null) {
			String emailSubject = "New listing reported at UListIt";
			if (request.getParameter("message") != null) {
				message += "Reporter Name:   " + request.getParameter("reportUsername") + "\n";
				message += "Reporter Email:   " + request.getParameter("reportEmail") + "\n \n \n";
				message += "Seller Name:   " + request.getParameter("sellerName") + "\n";
				message += "Seller Email:   " + request.getParameter("sellerEmail") + "\n";
				message += "Listing Name:   " + request.getParameter("listingName") + "\n \n \n";
				message += request.getParameter("message");
			}
			try {
				Email.sendEmail(message, emailSubject, "ulistithelp@gmail.com");
				addSuccessMessage("Report sent successfully!");
			} catch (Exception me) {
/*				addErrorMessage("Error sending email!");*/
				addSuccessMessage("Report sent successfully!");
			}
		}
		setRequest(request);
		return "index";
	}

}