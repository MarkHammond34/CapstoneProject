package edu.ben.controller;

import edu.ben.model.PickUp;
import edu.ben.model.Transaction;
import edu.ben.model.User;
import edu.ben.service.ListingService;
import edu.ben.service.PickUpService;
import edu.ben.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
@Transactional
public class CheckoutController extends BaseController {

    @Autowired
    TransactionService transactionService;

    @Autowired
    PickUpService pickUpService;

    @Autowired
    Environment environment;

    @Autowired
    ListingService listingService;

    @GetMapping("/checkout")
    public String checkoutPageGet(HttpServletRequest request, @RequestParam("l") int listingID) {

        try {
            User user = (User) request.getSession().getAttribute("user");

            if (user == null) {
                addWarningMessage("Login To Checkout");
                setRequest(request);
                request.getSession().setAttribute("lastPage", "/checkout?l=" + listingID);
                return "redirect:/login";
            }

            Transaction transaction = transactionService.getTransactionsByListingID(listingID);

            // Verify transaction was created
            if (transaction == null) {
                addErrorMessage("Error Loading Transaction");
                setRequest(request);
                return "redirect:" + request.getHeader("Referer");
            }

            // Verify user
            if (user.getUserID() != transaction.getBuyer().getUserID() && user.getUserID() != transaction.getSeller().getUserID()) {
                addWarningMessage("Access Denied");
                setRequest(request);
                return "redirect:" + request.getHeader("Referer");
            }


            PickUp pickUp = pickUpService.getPickUpByListingID(listingID);

            if (pickUp == null) {
                addErrorMessage("Error Loading Pick Up");
                setRequest(request);
                return "redirect:" + request.getHeader("Referer");
            }

            if (pickUp.getBuyerAccept() == 0 && user.getUserID() == transaction.getBuyer().getUserID()) {
                addWarningMessage("Pick Up Must Be Accepted Before Checkout");
                setRequest(request);
                return "redirect:" + request.getHeader("Referer");
            }

            if (pickUp.getBuyerAccept() == 0 && user.getUserID() == transaction.getSeller().getUserID()) {
                addWarningMessage("Pick Up Must Be Accepted By The Buyer Before Checkout");
                setRequest(request);
                return "redirect:" + request.getHeader("Referer");
            }

            request.setAttribute("title", "Checkout");
            request.setAttribute("listing", pickUp.getTransaction().getListingID());
            request.setAttribute("pickUp", pickUp);
            setRequest(request);
            return "checkout/checkout";

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/";
    }


}
