package edu.ben.service;

import edu.ben.dao.NotificationDAO;
import edu.ben.model.Notification;
import edu.ben.util.Email;
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
        notification.setSent(1);
        notificationDAO.save(notification);

        if (notification.getSubject() != null) {
            Email.sendEmail(notification.getMessage(), notification.getSubject(), notification.getUser().getSchoolEmail());
        } else {
            Email.sendEmail(notification.getMessage(), "U-ListIt Notification", notification.getUser().getSchoolEmail());
        }
    }

    @Override
    public void save(List<Notification> notifications) {
        for (Notification n : notifications) {
            n.setSent(1);
            notificationDAO.save(n);

            if (n.getSubject() != null) {
                Email.sendEmail(n.getMessage(), n.getSubject(), n.getUser().getSchoolEmail());
            } else {
                Email.sendEmail(n.getMessage(), "U-ListIt Notification", n.getUser().getSchoolEmail());
            }
        }
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
