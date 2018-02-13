package edu.ben.util;


import edu.ben.model.Notification;
import edu.ben.service.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Calendar;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

@Component
public class NotificationRunner {

    static NotificationService notificationService;

    private static Timer timer;

    @Autowired
    public void setNotificationService(NotificationService notificationService) {
        this.notificationService = notificationService;
    }

    public static void run() {

        if (timer != null) {
            timer.cancel();
        }

        timer = new Timer();

        List<Notification> notifications = notificationService.getAllActive();

        for (final Notification n : notifications) {
            try {
                timer.schedule(new TimerTask() {
                    @Override
                    public void run() {
                        // If notification needs to be sent in the next 10 seconds and hasn't been sent, send notifications and mark as sent
                        // 30000 == 10 seconds
                        if (n.getDelay() < 30000 && n.getSent() == 0) {
                            if (n.getSubject() != null) {
                                Email.sendEmail(n.getMessage(), n.getSubject(), n.getUser().getSchoolEmail());
                            } else {
                                Email.sendEmail(n.getMessage(), "U-ListIt Notification", n.getUser().getSchoolEmail());
                            }
                            System.out.println("SENT");
                            n.setSent(1);
                            notificationService.update(n);
                        }
                    }
                }, n.getDelay());

            } catch (IllegalArgumentException e) {

                Calendar cal = Calendar.getInstance();
                cal.add(Calendar.DATE, 7);
                // If notification is 7 days old and hasn't been dismissed, deactivate it
                if (n.getDelay() < (System.currentTimeMillis() - cal.getTimeInMillis()) && n.getActive() == 1) {
                    n.setActive(0);
                    notificationService.update(n);

                    // If notification needs to be sent and hasn't been sent, send notifications and mark as sent
                    // 1500 == 0.5 seconds
                } else if (n.getSent() == 0) {
                    Email.sendEmail(n.getMessage(), "U-ListIt Notification", n.getUser().getSchoolEmail());
                    n.setSent(1);
                    notificationService.update(n);
                }
            }
        }
    }
}