package edu.ben.controller;

import com.google.gson.JsonObject;
import edu.ben.model.Tutorial;
import edu.ben.model.User;
import edu.ben.service.TutorialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class TutorialController extends BaseController {

    @Autowired
    TutorialService tutorialService;

    @RequestMapping(value = "/checkForTutorial", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody
    String checkForTutorial(HttpServletRequest request) {

        User user = (User) request.getSession().getAttribute("user");

        JsonObject json = new JsonObject();

        if (user != null) {

            Tutorial tutorial = tutorialService.getByUserID(user.getUserID());

            json.addProperty("viewedHome", String.valueOf(tutorial.getViewedHome()));
            json.addProperty("viewedListing", String.valueOf(tutorial.getViewedListing()));
            json.addProperty("viewedDashboard", String.valueOf(tutorial.getViewedDashboard()));
            json.addProperty("viewedChecklist", String.valueOf(tutorial.getViewedChecklist()));
            json.addProperty("viewedPickup", String.valueOf(tutorial.getViewedPickup()));
            json.addProperty("viewSavedSearch", String.valueOf(tutorial.getViewedSavedSearch()));
            json.addProperty("viewedTransactionHistory", String.valueOf(tutorial.getViewedTransactionHistory()));
            json.addProperty("viewedDonateAnItem", String.valueOf(tutorial.getViewedDonateAnItem()));

            return json.toString();

        }

        json.addProperty("user", "null");
        return json.toString();
    }
}
