package edu.ben.util;


import edu.ben.model.Notification;
import edu.ben.service.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

@Component("NotificationRunner")
public class NotificationRunner {

    public static void send(List<Notification> notifications) {

        Timer timer = new Timer();

        System.out.println(notifications.size());

        for (final Notification n : notifications) {
            timer.schedule(new TimerTask() {
                @Override
                public void run() {
                    System.out.println("Notification " + n.getMessage() + " Sent");
                    // Email.sendEmail(n.getMessage(), "U-ListIt Notification", n.getUser().getSchoolEmail());
                }
            }, Math.abs(n.getDelay()));
        }
    }
}