package edu.ben.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import edu.ben.dao.SavedSearchDAO;
import edu.ben.model.Listing;
import edu.ben.model.SavedSearch;

import edu.ben.model.SearchHistory;
import edu.ben.model.Tutorial;
import edu.ben.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.UnexpectedRollbackException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.ben.model.User;

@Controller
public class SearchController {

    @Autowired
    UserService userService;

    @Autowired
    ListingService listingService;

    @Autowired
    SavedSearchService savedSearchService;

    @Autowired
    SearchHistoryService searchHistoryService;

    @Autowired
    TutorialService tutorialService;

    @RequestMapping(value = "/searchResults", method = RequestMethod.POST)
    public String searchCategory(@RequestParam("search") String search, HttpServletRequest request, Model model) {
        String saved = "";
        User user = (User) request.getSession().getAttribute("user");

        if (user != null) {
            if (savedSearchService.isSaved(user.getUserID(), search)) {
                saved = "saved";
            }
        }

        if (user != null) {

            try {
                searchHistoryService.save(new SearchHistory(user, search));
            } catch (UnexpectedRollbackException e) {
                e.printStackTrace();
            }

            List<Listing> relevant = listingService.getRelevantListingsByUserID(user.getUserID());
            if (relevant.size() > 5) {
                request.setAttribute("relevantListings", listingService.getRelevantListingsByUserID(user.getUserID()).subList(0, 4));
            } else {
                request.setAttribute("relevantListings", relevant);
            }
        } else {
            request.setAttribute("relevantListings", null);
        }

        List<Listing> listingSearch = listingService.listingSearch(search);

        List<Listing> endingLatest = listingService.listingsSearchEndingLatest(search);


        List<Listing> endingSoonest = listingService.listingsSearchEndingSoonest(search);

        List<Listing> mostExpensive = listingService.listingSearchMostExpensive(search);
        System.out.println("Most expensive size: " + mostExpensive.size());
        List<Listing> leastExpensive = listingService.listingSearchLeastExpensive(search);

        List<User> userSearch = userService.searchUser(search);
        System.out.println("user size: " + userSearch.size());

//        System.out.println("search result size: " + userSearch.size());
//        request.setAttribute("userSearch", userSearch);

        request.setAttribute("search", search);
        request.setAttribute("listingSearch", listingSearch);
        request.setAttribute("endingLatest", endingLatest);
        request.setAttribute("endingSoonest", endingSoonest);
        request.setAttribute("mostExpensive", mostExpensive);
        request.setAttribute("leastExpensive", leastExpensive);
        request.setAttribute("user", user);
        request.setAttribute("saved", saved);
        request.setAttribute("userSearch", userSearch);

        if (user != null && user.getTutorial().getViewedSavedSearch() == 0) {

            // Update tutorial
            Tutorial tutorial = user.getTutorial();
            tutorial.setViewedSavedSearch(1);
            tutorialService.update(tutorial);

            // Set updated tutorial
            user.setTutorial(tutorial);
            request.getSession().removeAttribute("user");
            request.getSession().setAttribute("user", user);

            request.setAttribute("showTutorial", true);

        }

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
