package edu.ben.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import edu.ben.model.Listing;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.ben.model.User;
import edu.ben.service.ListingService;
import edu.ben.service.UserService;

@Controller
public class SearchController {

	@Autowired
	UserService userService;
	
	@Autowired
	ListingService listingService;

	@RequestMapping(value = "/searchResults", method = RequestMethod.POST)
	public String searchCategory(@RequestParam("search") String search, HttpServletRequest request, Model model) {
		
		List<Listing> categoryListing = listingService.getAllListingsByCategory(search);
		System.out.println("CategoryListing Size: " + categoryListing.size());
		System.out.println(search);
		
		ArrayList<User> userSearch = (ArrayList<User>) userService.searchUser(search);
		
		
		System.out.println("search result size: " + userSearch.size());
		request.setAttribute("userSearch", userSearch);
		
		
		User user = (User) request.getSession().getAttribute("user");
		
		request.setAttribute("search", search);
		request.setAttribute("categoryListing", categoryListing);
		request.setAttribute("user", user);
		
		return "searchResults";

		

	}

//	@RequestMapping(value = "/searchResults")
//	public String searchResults() {
//		return "searchResults";
//	}
}
