package edu.ben.controller;

import edu.ben.model.Notification;
import edu.ben.model.User;
import edu.ben.service.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class NotificationController extends BaseController {

    @Autowired
    NotificationService notificationService;

    @GetMapping("/notifications")
    public String getNotificationsPage(HttpServletRequest request) {

        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            addWarningMessage("Login To See Notifications");
            setRequest(request);
            return "login";
        }

        List<Notification> activeNotifications = notificationService.getActiveByUserID(user.getUserID());

        request.setAttribute("pageCount", activeNotifications.size() / 15);

        ArrayList<Notification> currentPage = new ArrayList<Notification>(15);
        int currentPageCounter = 1;
        for (int i = 1; i < activeNotifications.size() + 1; i++) {
            if (i % 15 == 0) {
                currentPage.add(activeNotifications.get(i - 1));
                request.setAttribute("page" + currentPageCounter, currentPage);
                currentPageCounter++;
            } else {
                currentPage.add(activeNotifications.get(i - 1));
            }
        }

        request.setAttribute("title", "Notifications");
        setRequest(request);
        return "notifications";
    }
}
