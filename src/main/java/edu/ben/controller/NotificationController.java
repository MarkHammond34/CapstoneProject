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
        request.setAttribute("active", activeNotifications);


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

    @GetMapping("/dismiss")
    public String dismiss(int n, HttpServletRequest request) {

        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            addWarningMessage("Login To Dismiss Notifications");
            setRequest(request);
            return "login";
        }

        int results = notificationService.dismiss(user.getUserID(), n);

        if (results < 1) {
            addErrorMessage("Dismissal Error");
        } else {
            addSuccessMessage("Dismissed");
        }

        updateNotifications(request, notificationService);

        setRequest(request);
        return "redirect:" + request.getHeader("Referer");

    }

    @GetMapping("/remove")
    public String remove(int n, HttpServletRequest request) {

        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            addWarningMessage("Login To Remove Notifications");
            setRequest(request);
            return "login";
        }

        int results = notificationService.remove(user.getUserID(), n);

        if (results < 1) {
            addErrorMessage("Removal Error");
        } else {
            addSuccessMessage("Removed");
        }

        updateNotifications(request, notificationService);

        setRequest(request);
        return "redirect:" + request.getHeader("Referer");
    }

    @GetMapping("/removeAll")
    public String removeAll(List<Notification> n, HttpServletRequest request) {

        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            addWarningMessage("Login To Remove Notifications");
            setRequest(request);
            return "login";
        }

        for (Notification not : n) {
            notificationService.remove(user.getUserID(), not.getNotificationID());
        }

        updateNotifications(request, notificationService);

        setRequest(request);
        return "redirect:" + request.getHeader("Referer");
    }

    @GetMapping("/markAsViewed")
    public void markAsViewed(HttpServletRequest request) {

        notificationService.markAsViewed((List<Notification>) request.getSession().getAttribute("notifications"));

        updateNotifications(request, notificationService);
    }

    public static void updateNotifications(HttpServletRequest request, NotificationService notificationService) {

        User user = (User) request.getSession().getAttribute("user");

        if (user != null) {
            List<Notification> notifications = notificationService.getNotDismissedByUserID(user.getUserID());
            if (notifications.size() == 0) {
                request.getSession().setAttribute("notifications", null);
            } else {
                request.getSession().setAttribute("notifications", notifications);

                int count = 0;
                for (Notification n : notifications) {
                    if (n.getViewed() == 0) {
                        count++;
                    }
                }

                request.getSession().setAttribute("unviewedNotificationCount", count);
            }
        } else {
            request.getSession().setAttribute("notifications", null);
        }
    }
}
