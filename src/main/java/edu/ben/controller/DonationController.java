package edu.ben.controller;

import edu.ben.model.Listing;
import edu.ben.model.Tutorial;
import edu.ben.model.User;
import edu.ben.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class DonationController extends BaseController {

    @Autowired
    ListingService listingService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    TutorialService tutorialService;

    @GetMapping("/donation")
    public String donation(HttpServletRequest request) {

        request.setAttribute("donations", listingService.findAllDonatedListings());

        request.setAttribute("categories", categoryService.getAllCategories());

        return "donation/donation";
    }

    @GetMapping("/search-donation-by-category")
    public String donationByCategory(HttpServletRequest request, @RequestParam("c") String category) {

        request.setAttribute("donations", listingService.findAllDonatedListingsByCategory(category));

        return "donation/donation-by-category";
    }

    @GetMapping("/search-donations")
    public String searchDonations(HttpServletRequest request, @RequestParam("s") String search) {

        request.setAttribute("results", listingService.listingsSearchDonations(search));

        return "donation/donate-an-item";
    }

    @GetMapping("/donate-an-item")
    public String donateAnItem(HttpServletRequest request) {

        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            addWarningMessage("Login To Donate An Item");
            setRequest(request);
            return "redirect:/login";
        }

        if (user.getTutorial() != null && user.getTutorial().getViewedDonateAnItem() == 0) {

            // Update tutorial
            Tutorial tutorial = user.getTutorial();
            tutorial.setViewedDonateAnItem(1);
            tutorialService.update(tutorial);

            // Set updated tutorial
            user.setTutorial(tutorial);
            request.getSession().removeAttribute("user");
            request.getSession().setAttribute("user", user);

            request.setAttribute("showTutorial", true);

        }

        request.setAttribute("categories", categoryService.getAllCategories());
        request.setAttribute("subCategories", categoryService.getAllSubCategories());

        return "donation/donate-an-item";
    }

}
