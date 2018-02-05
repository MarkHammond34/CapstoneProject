package edu.ben.controller;

import edu.ben.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
public class MessageController extends BaseController{
    @Autowired
    MessageService messageService;

    @RequestMapping(value = "/messageDashboard", method = RequestMethod.GET)
    public String messageDashboard(HttpServletRequest request){
        return "messaging/messageDashboard";
    }


}
