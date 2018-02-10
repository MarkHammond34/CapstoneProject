package edu.ben.util;


import edu.ben.model.Notification;
import edu.ben.service.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import java.util.Calendar;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

@Component("NotificationRunner")
public class NotificationRunner {

    @Autowired
    static NotificationService notificationService;

    public static void run() {

        Timer timer = new Timer();

        List<Notification> notifications = notificationService.getAllActive();

        for (final Notification n : notifications) {
            timer.schedule(new TimerTask() {
                @Override
                public void run() {

                    Calendar cal = Calendar.getInstance();
                    cal.add(Calendar.DATE, 7);
                    // If notification is 7 days old and hasn't been dismissed, deactivate it
                    if (n.getDelay() < cal.getTimeInMillis()){
                        n.setActive(0);
                        notificationService.update(n);

                        // If notification needs to be sent and hasn't been sent, send notifications and mark as sent
                        // 1500 == 0.5 seconds
                    } else if (n.getDelay() < 1500 && n.getSent() == 0) {
                        // Email.sendEmail(n.getMessage(), "U-ListIt Notification", n.getUser().getSchoolEmail());
                        n.setSent(1);
                        notificationService.update(n);
                    }
                }
            }, n.getDelay());
        }
    }
}