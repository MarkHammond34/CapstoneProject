package edu.ben.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import edu.ben.dao.SavedSearchDAO;
import edu.ben.model.Listing;
import edu.ben.model.SavedSearch;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.ben.model.User;
import edu.ben.service.ListingService;
import edu.ben.service.SavedSearchService;
import edu.ben.service.UserService;

@Controller
public class SearchController {

	@Autowired
	UserService userService;

	@Autowired
	ListingService listingService;

	@Autowired
	SavedSearchService savedSearchService;

	@RequestMapping(value = "/searchResults", method = RequestMethod.POST)
	public String searchCategory(@RequestParam("search") String search, HttpServletRequest request, Model model) {
		String saved = "";
		User user = (User) request.getSession().getAttribute("user");

		if (user != null) {
			if (savedSearchService.isSaved(user.getUserID(), search)) {
				saved = "saved";
			}
		}

		List<Listing> listingSearch = listingService.listingSearch(search);
		
		List<Listing> endingLatest = listingService.listingsSearchEndingLatest(search);

		
		List<Listing> endingSoonest = listingService.listingsSearchEndingSoonest(search);
		
		List<Listing> mostExpensive = listingService.listingSearchMostExpensive(search);
		System.out.println("Most expensive size: " + mostExpensive.size());
		List<Listing> leastExpensive = listingService.listingSearchLeastExpensive(search);

		ArrayList<User> userSearch = (ArrayList<User>) userService.searchUser(search);

		System.out.println("search result size: " + userSearch.size());
		request.setAttribute("userSearch", userSearch);

		request.setAttribute("search", search);
		request.setAttribute("listingSearch", listingSearch);
		request.setAttribute("endingLatest", endingLatest);
		request.setAttribute("endingSoonest", endingSoonest);
		request.setAttribute("mostExpensive", mostExpensive);
		request.setAttribute("leastExpensive", leastExpensive);
		request.setAttribute("user", user);
		request.setAttribute("saved", saved);

		return "searchResults";

	}

	@RequestMapping(value = "/saveSearch", method = RequestMethod.GET)
	public String saveSearch(@RequestParam("search") String search, HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");

		System.out.println("search: " + search);

		SavedSearch s = new SavedSearch(search);

		s.setUser(user);

		if (savedSearchService.isSaved(user.getUserID(), search) == true) {
			System.out.println("Already Saved, deleted");
			SavedSearch existing = savedSearchService.getSearch(user.getUserID(), search);
			savedSearchService.deleteSavedSearch(existing.getId());
		} else {
			System.out.println("Search Result Saved");
			savedSearchService.create(s);
		}

		return "searchResults";
	}
	
	
}
