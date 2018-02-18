package edu.ben.controller;

import edu.ben.service.FaqService;
import edu.ben.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class FaqsController extends BaseController {

    @Autowired
    UserService userService;

    @Autowired
    FaqService faqService;

    @GetMapping("/faq")
    public String getFaqs(HttpServletRequest request) {

        request.setAttribute("faqs", faqService.getAllFaqs());
        setRequest(request);
        return "faq";
    }

}