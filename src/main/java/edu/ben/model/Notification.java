package edu.ben.model;

import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import java.sql.Time;
import java.sql.Timestamp;

@Entity(name = "notification")
@Table(name = "notification")
@Transactional
public class Notification {

    @Column(name = "notification_id")
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public int notificationID;

    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;

    @Column(name = "listing_id")
    private int listingID;

    @Column(name = "message")
    private String message;

    @Column(name = "send_timestamp")
    private Timestamp sendTimestamp;

    @Transient
    private long delay;

    @Column(name = "date_created")
    private Timestamp dateCreated;

    @Column(name = "active")
    private int active;

    @Column(name = "sent")
    private int sent;

    public Notification() {

    }

    public Notification(User user, int listingID, String message, Timestamp sendTimestamp, int active) {
        this.user = user;
        this.listingID = listingID;
        this.message = message;
        this.sendTimestamp = sendTimestamp;
        this.active = active;
    }

    public int getNotificationID() {
        return notificationID;
    }

    public void setNotificationID(int notificationID) {
        this.notificationID = notificationID;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getListingID() {
        return listingID;
    }

    public void setListingID(int listingID) {
        this.listingID = listingID;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Timestamp getSendTimestamp() {
        return sendTimestamp;
    }

    public void setSendTimestamp(Timestamp sendTimestamp) {
        this.sendTimestamp = sendTimestamp;
    }

    public long getDelay() {
        return sendTimestamp.getTime() - System.currentTimeMillis();
    }

    public void setDelay(long delay) {
        this.delay = delay;
    }

    public Timestamp getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Timestamp dateCreated) {
        this.dateCreated = dateCreated;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public int getSent() {
        return sent;
    }

    public void setSent(int sent) {
        this.sent = sent;
    }
}
