package edu.ben.controller;

import edu.ben.model.Conversation;
import edu.ben.model.Message;
import edu.ben.model.PickUp;
import edu.ben.model.User;
import edu.ben.service.MessageService;
import edu.ben.service.PickUpService;
import edu.ben.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpOutputMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class MessageController extends BaseController {
    @Autowired
    MessageService messageService;

    @Autowired
    UserService userService;

    @Autowired
    PickUpService pickUpService;

    @RequestMapping(value = "/messageDashboard", method = RequestMethod.GET)
    public String messageDashboard(HttpServletRequest request) {
        User sessionUser = (User) request.getSession().getAttribute("user");
        List<Conversation> conversations = messageService.getConversation(sessionUser);
        request.getSession().setAttribute("userConversations", conversations);
        return "messaging/messageDashboard";
    }

    @RequestMapping(value = "/generateConversation", method = RequestMethod.GET)
    public String generateConversation(HttpServletRequest request) {
        List<User> allUsers = userService.getRecentUsers();
        User sessionUser = (User) request.getSession().getAttribute("user");
        allUsers.remove(sessionUser);
        request.getSession().setAttribute("allUsers", allUsers);
        return "messaging/createConversation";
    }

    @RequestMapping(value = "/addConversation", method = RequestMethod.POST)
    public String addConversation(HttpServletRequest request) {
        User sendBy = (User) request.getSession().getAttribute("user");
        User sendTo = userService.findBySchoolEmail(request.getParameter("generateConversation"));
        System.out.println(sendBy.getUserID());
        System.out.println(sendTo.getUserID());
        Conversation input = new Conversation(sendBy, sendTo);
        messageService.saveOrUpdate(input);
        return "messaging/messageDashboard";
    }

    @RequestMapping(value = "viewConversation", method = RequestMethod.POST)
    public String viewConversation(HttpServletRequest request) {
        User sendBy = (User) request.getSession().getAttribute("user");
        User sendTo = userService.findBySchoolEmail(request.getParameter("UserConversation"));
        List<Message> messages = messageService.getMessages(sendBy, sendTo);
        request.getSession().setAttribute("messages", messages);
        request.getSession().setAttribute("conversationUser", sendTo);
        return "messaging/messagePage";
    }

    @RequestMapping(value = "sendMessage", method = RequestMethod.POST)
    public String sendMessage(HttpServletRequest request) {
        User sendBy = (User) request.getSession().getAttribute("user");
        User sendTo = userService.findBySchoolEmail(request.getParameter("SubmitMessage"));
        String message = request.getParameter("stringMessage");
        messageService.sendMessage(sendBy, sendTo, message);
        List<Message> messages = messageService.getMessages(sendBy, sendTo);
        request.getSession().setAttribute("messages", messages);
        request.getSession().setAttribute("conversationUser", sendTo);
        return "messaging/messagePage";
    }

}
