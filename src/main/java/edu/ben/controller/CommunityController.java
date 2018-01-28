package edu.ben.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommunityController {

	@RequestMapping("/community")
	public String viewCommunity() {
		return "community";
	}
}
