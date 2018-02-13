package edu.ben.service;

import edu.ben.dao.NotificationDAO;
import edu.ben.model.Notification;
import edu.ben.util.NotificationRunner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class NotificationServiceImpl implements NotificationService {

    NotificationDAO notificationDAO;

    @Autowired
    public void setListingDAO(NotificationDAO notificationDAO) {
        this.notificationDAO = notificationDAO;
    }

    @Override
    public void save(Notification notification) {
        notificationDAO.save(notification);
        NotificationRunner.run();
    }

    @Override
    public void save(List<Notification> notifications) {
        for (Notification n : notifications) {
            notificationDAO.save(n);
        }
        NotificationRunner.run();
    }

    @Override
    public void update(Notification notification) {
        notificationDAO.update(notification);
    }

    @Override
    public List<Notification> getAllActive() {
        return notificationDAO.getAllActive();
    }

    @Override
    public void deactivate(int notificationID) {
        notificationDAO.deactivate(notificationID);
    }

    @Override
    public List<Notification> getActiveByUserID(int userID) {
        return notificationDAO.getActiveByUserID(userID);
    }

    @Override
    public List<Notification> getNotDismissedByUserID(int userID) {
        return notificationDAO.getNotDismissedByUserID(userID);
    }

    @Override
    public void dismiss(int id) {
        notificationDAO.dismiss(id);
    }

    @Override
    public void markAsSent(List<Notification> notifications) {
        for (Notification n : notifications) {
            n.setSent(1);
            notificationDAO.update(n);
        }
    }

    @Override
    public void markAsViewed(List<Notification> notifications) {
        if (notifications != null) {
            for (Notification n : notifications) {
                n.setViewed(1);
                notificationDAO.update(n);
            }
        }
    }
}
