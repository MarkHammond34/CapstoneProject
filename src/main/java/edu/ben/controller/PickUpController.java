package edu.ben.controller;

import edu.ben.service.LocationService;
import edu.ben.service.PickUpService;
import edu.ben.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class PickUpController extends BaseController {

    @Autowired
    TransactionService transactionService;

    @Autowired
    LocationService locationService;

    @Autowired
    PickUpService pickUpService;

    @Autowired
    private Environment environment;

    @GetMapping("/pick-up")
    public String pickUpGet(HttpServletRequest request) {
        request.setAttribute("title", "Pick Up");
        request.setAttribute("latitude", environment.getProperty("school.latitude"));
        request.setAttribute("longitude", environment.getProperty("school.longitude"));
        request.setAttribute("meetingLat", 41.779378);
        request.setAttribute("meetingLong", -88.09678);
        setRequest(request);
        return "pick-up";
    }

    @PostMapping("/pick-up")
    public String pickUpPost(HttpServletRequest request) {
        return "pick-up";
    }

    @PostMapping("/pick-up-create")
    public String pickUpCreate(HttpServletRequest request) {
        return "";
    }

}
