package edu.ben.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.ben.util.Email;

@Controller
public class TransactionController extends BaseController {

	@RequestMapping(value="/checkoutPage", method=RequestMethod.GET)
	public ModelAndView checkoutPage() {
		return new ModelAndView("checkout");
	}
	
	@RequestMapping(value="/button", method=RequestMethod.POST)
	public ModelAndView buyNow() {
		
		// Still needs work.
		
		String userEmail = "email";
		String subject = "One of your listings has been purchased!";
		String message = "Your item: " + "item name" + " has been purchased.";
		
		//if (purchased)
		Email.sendEmail(message, subject, userEmail);
		
		
		return new ModelAndView("redirect:/profile");
	}
	
}
