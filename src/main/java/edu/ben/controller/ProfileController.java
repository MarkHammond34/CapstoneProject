package edu.ben.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.ben.model.Listing;
import edu.ben.model.User;
import edu.ben.service.ListingService;
import edu.ben.service.UserService;

@Controller
public class ProfileController {
	@Autowired
	UserService userService;
	
	@Autowired
	ListingService listingService;
	
	@RequestMapping(value = "/viewProfile", method = RequestMethod.GET)
	public String viewProfile(HttpServletRequest request) {
		User session = (User) request.getSession().getAttribute("user");
		
		List<Listing> userListings = listingService.getAllListingsByUserID(session.getUserID());
		
		request.setAttribute("user", session);
		request.setAttribute("userListings", userListings);
		
		return "profilePage2";
	}
	

}
