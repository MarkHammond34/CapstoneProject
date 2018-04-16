package edu.ben.controller;

import edu.ben.model.Faq;
import edu.ben.service.FaqService;
import edu.ben.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class FaqsController extends BaseController {

    @Autowired
    FaqService faqService;

    @GetMapping("/faqs")
    public String getFaqs(HttpServletRequest request) {

        request.setAttribute("faqs", faqService.getAllFaqs());
        request.setAttribute("title", "Frequently Asked Questions");
        setRequest(request);
        return "faqs/faqs";
    }
}