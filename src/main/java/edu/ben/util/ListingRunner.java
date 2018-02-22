package edu.ben.util;

import edu.ben.model.Listing;
import edu.ben.model.Notification;
import edu.ben.model.User;
import edu.ben.service.ListingService;
import edu.ben.service.NotificationService;
import edu.ben.service.UserService;
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

    private static UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
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

                            List<Notification> newNotifications = new ArrayList<Notification>();

                            if (l.getHighestBidder() == null) {
                                // Send notification to seller that no one placed a big
                                newNotifications.add(new Notification(l.getUser(), l.getId(), "Your Listing Ended", "Listing: " + l.getName() + " ended without any bids.", new Timestamp(System.currentTimeMillis() + 120000), 1));
                            } else {
                                // Create notification for buyer
                                newNotifications.add(new Notification(l.getHighestBidder(), l.getId(), "You Won!", "You Won! \n Listing: " + l.getName(), new Timestamp(System.currentTimeMillis() + 120000), 1));
                                // Create notification for seller
                                newNotifications.add(new Notification(l.getUser(), l.getId(), "Sold!", "Sold! \n Listing: " + l.getName(), new Timestamp(System.currentTimeMillis() + 120000), 1));

                                // Create notifications or losers
                                List<User> losers = userService.getListingLosers(l.getId(), l.getHighestBidder().getUserID());
                                for (User u : losers) {
                                    System.out.println("Loser ID: " + u.getUserID());
                                    newNotifications.add(new Notification(u, l.getId(), "You Lost!", "You Lost! \n Listing: " + l.getName(), new Timestamp(System.currentTimeMillis() + 120000), 1));
                                }
                            }

                            // Batch update for efficiency
                            notificationService.save(newNotifications);

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
                if (l.getDelay() < (System.currentTimeMillis() - cal.getTimeInMillis()) && l.getActive() == 1) {
                    l.setActive(0);
                    listingService.saveOrUpdate(l);

                    // Fail safe
                } else if (l.getEnded() == 0) {

                    List<Notification> newNotifications = new ArrayList<Notification>();

                    if (l.getHighestBidder() == null) {
                        // Send notification to seller that no one placed a big
                        newNotifications.add(new Notification(l.getUser(), l.getId(), "Listing Ended", "Listing: " + l.getName() + " ended without any bids.", new Timestamp(System.currentTimeMillis() + 120000), 1));
                    } else {
                        // Create notification for buyer
                        newNotifications.add(new Notification(l.getHighestBidder(), l.getId(), "You Won!", "You Won! \n Listing: " + l.getName(), new Timestamp(System.currentTimeMillis() + 120000), 1));
                        // Create notification for seller
                        newNotifications.add(new Notification(l.getUser(), l.getId(), "Sold!", "Sold! \n Listing: " + l.getName(), new Timestamp(System.currentTimeMillis() + 120000), 1));

                        // Create notifications or losers
                        List<User> losers = userService.getListingLosers(l.getId(), l.getHighestBidder().getUserID());
                        for (User u : losers) {
                            newNotifications.add(new Notification(u, l.getId(), "You Lost!", "You Lost! \n Listing: " + l.getName(), new Timestamp(System.currentTimeMillis() + 120000), 1));
                        }
                    }

                    // Batch update for efficiency
                    notificationService.save(newNotifications);

                    System.out.println("LISTING: " + l.getName() + " ENDED AT SUBZERO");

                    l.setEnded(1);
                    listingService.saveOrUpdate(l);
                }
            }
        }
    }
}
