package edu.ben.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DonationsController {

	@RequestMapping(value = "/donationLanding", method = RequestMethod.GET)
	public String landing(HttpServletRequest request) {
		return "donations";
	}
}
