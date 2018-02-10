package edu.ben.util;

import edu.ben.model.Listing;
import edu.ben.model.Notification;
import edu.ben.service.ListingService;
import edu.ben.service.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.util.*;

@Component
public class ListingRunner {

    private static Timer timer;

    private static ListingService listingService;

    @Autowired
    public void setListingService(ListingService listingService) {
        this.listingService = listingService;
    }

    private static NotificationService notificationService;

    @Autowired
    public void setNotificationService(NotificationService notificationService) {
        this.notificationService = notificationService;
    }

    public static void run() {

        if (timer != null) {
            timer.cancel();
        }

        timer = new Timer();

        List<Listing> listings = listingService.getActiveListings();

        for (final Listing l : listings) {
            try {
                timer.schedule(new TimerTask() {
                    @Override
                    public void run() {
                        // If listing time ran out and is still marked as in progress, send notifications and end listing
                        // 1500 == 0.5 seconds
                        if (l.getDelay() < 1500 && l.getEnded() == 0) {
                            // Create notification for buyer
                            notificationService.save(new Notification(l.getHighestBidder(), l.getId(), "You Won! \n Listing: " + l.getName(), new Timestamp(System.currentTimeMillis() + 120000), 1));
                            // Create notification for seller
                            notificationService.save(new Notification(l.getUser(), l.getId(), "Sold! \n Listing: " + l.getName(), new Timestamp(System.currentTimeMillis() + 120000), 1));

                            System.out.println("LISTING: " + l.getName() + " ENDED");

                            l.setEnded(1);
                            listingService.saveOrUpdate(l);
                        }
                    }
                }, l.getDelay());

            } catch (IllegalArgumentException e) {

                Calendar cal = Calendar.getInstance();
                cal.add(Calendar.DATE, 3);

                // If listing ended 3 days ago, deactivate it
                if (l.getDelay() < (System.currentTimeMillis() - cal.getTimeInMillis())) {
                    l.setActive(0);

                    // Fail safe
                } else if (l.getEnded() == 0){
                    // Create notification for buyer
                    notificationService.save(new Notification(l.getHighestBidder(), l.getId(), "You Won!\nListing: " + l.getName(), new Timestamp(System.currentTimeMillis() + 120000), 1));
                    // Create notification for seller
                    notificationService.save(new Notification(l.getUser(), l.getId(), "Sold!\nListing: " + l.getName(), new Timestamp(System.currentTimeMillis() + 120000), 1));

                    l.setEnded(1);
                    listingService.saveOrUpdate(l);
                }
            }
        }
    }
}
