package edu.ben.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TransactionController {

	@RequestMapping(value="/checkoutPage", method=RequestMethod.GET)
	public ModelAndView checkoutPage() {
		System.out.println("test");
		return new ModelAndView("checkout");
	}
	
	@RequestMapping(value="/button", method=RequestMethod.POST)
	public ModelAndView checkoutTest() {
		
		
		
		return new ModelAndView("redirect:/");
	}
	
}
