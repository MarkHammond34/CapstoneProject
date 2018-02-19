package edu.ben.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.transaction.annotation.Transactional;

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

    @Column(name = "subject")
    private String subject;

    @Column(name = "message")
    private String message;

    @Column(name = "send_timestamp")
    private Timestamp sendTimestamp;

    @Column(name = "date_created")
    private Timestamp dateCreated;

    @Column(name = "active")
    private int active;

    @Column(name = "sent")
    private int sent;

    @Column(name = "dismissed")
    private int dismissed;

    @Column(name = "viewed")
    private int viewed;

    public Notification() {

    }

    public Notification(User user, int listingID, String message, int active) {
        this.user = user;
        this.listingID = listingID;
        this.message = message;
        this.subject = "U-ListIt Notification";
        this.sendTimestamp = new Timestamp(System.currentTimeMillis());
        this.active = active;
    }

    public Notification(User user, int listingID, String subject, String message, int active) {
        this.user = user;
        this.listingID = listingID;
        this.subject = subject;
        this.message = message;
        this.sendTimestamp = new Timestamp(System.currentTimeMillis());
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

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public int getDismissed() {
        return dismissed;
    }

    public void setDismissed(int dismissed) {
        this.dismissed = dismissed;
    }

    public int getViewed() {
        return viewed;
    }

    public void setViewed(int viewed) {
        this.viewed = viewed;
    }
}
