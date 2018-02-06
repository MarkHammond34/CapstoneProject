package edu.ben.dao;

import edu.ben.model.Notification;

import java.util.List;

public interface NotificationDAO {

    public void save(Notification notification);

    public void update(Notification notification);

    public void deactivate(int notificationID);

    public List<Notification> getActiveByUserID(int userID);
}
