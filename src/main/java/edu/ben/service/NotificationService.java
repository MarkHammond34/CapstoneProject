package edu.ben.service;

import edu.ben.model.Notification;

import java.util.List;

public interface NotificationService {

    public void save(Notification notification);

    public void deactivate(int notificationID);

    public List<Notification> getActiveByUserID(int userID);

    public List<Notification> getAllActive();

    public void markAsSent(List<Notification> notifications);
}
