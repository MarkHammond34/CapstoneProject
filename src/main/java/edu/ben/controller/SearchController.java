package edu.ben.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.Mapping;
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

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String searchCategory(@RequestParam("search") String search, HttpServletRequest request, Model model) {

		System.out.println("Hit search Controller");
		List<User> users = userService.searchByFirstName(search);

		System.out.println("Users first name size: " + users.size());
		
		

		return "createListing";

		

	}
}
