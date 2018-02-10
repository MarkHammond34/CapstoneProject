package edu.ben.util;

import edu.ben.model.Listing;
import edu.ben.model.Notification;
import edu.ben.service.ListingService;
import edu.ben.service.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;

import java.sql.Timestamp;
import java.util.*;

public class ListingRunner {

    @Autowired
    static ListingService listingService;

    @Autowired
    static NotificationService notificationService;

    public static void run() {

        Timer timer = new Timer();

        List<Listing> listings = listingService.getActiveListings();

        for (final Listing l : listings) {
            timer.schedule(new TimerTask() {
                @Override
                public void run() {

                    Calendar cal = Calendar.getInstance();
                    cal.add(Calendar.DATE, 3);

                    // If listing ended 3 days ago, deactivate it
                    if (l.getDelay() < cal.getTimeInMillis()) {
                        l.setActive(0);

                        // If listing time ran out and is still marked as in progress, send notifications and end listing
                        // 1500 == 0.5 seconds
                    } else if (l.getDelay() < 1500 && l.getEnded() == 0) {

                        l.setEnded(1);
                        // Create notification for buyer
                        notificationService.save(new Notification(l.getHighestBidder(), l.getId(), "You Won! <br> Listing: " + l.getName(), new Timestamp(System.currentTimeMillis() + 120000)));
                        // Create notification for seller
                        notificationService.save(new Notification(l.getUser(), l.getId(), "Sold! <br> Listing: " + l.getName(), new Timestamp(System.currentTimeMillis() + 120000)));
                    }
                }
            }, l.getDelay());
        }
    }
}
