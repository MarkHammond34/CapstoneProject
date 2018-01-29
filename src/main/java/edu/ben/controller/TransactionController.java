package edu.ben.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TransactionController {

	@RequestMapping("/checkout")
	public String checkoutTest() {
		
		return "checkout";
	}
	
}
