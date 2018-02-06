package edu.ben.util;


import edu.ben.model.Notification;
import edu.ben.service.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

public class NotificationRunner {

    @Autowired
    static NotificationService notificationService;

    public static void run(int userID) {

        final List<Notification> notifications = notificationService.getActiveByUserID(userID);

        Timer timer = new Timer();

        for (final Notification n : notifications) {
            if (n.getDelay() > 0) {
                timer.schedule(new TimerTask() {
                    @Override
                    public void run() {
                        Email.sendEmail(n.getMessage(), "U-ListIt Notification", n.getUser().getSchoolEmail());
                    }
                }, n.getDelay());
            }
        }
    }
}