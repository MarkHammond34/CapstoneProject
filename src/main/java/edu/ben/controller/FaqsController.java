package edu.ben.controller;

import edu.ben.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class FaqsController extends BaseController {

    @Autowired
    UserService userService;

    @GetMapping("/faqs")
    public String getFaqs(HttpServletRequest request) {
        setRequest(request);
        return "faqs";
    }

}