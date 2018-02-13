package edu.ben.dao;

import edu.ben.model.User;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Repository
public class UserDAOImpl implements UserDAO {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @SuppressWarnings("unchecked")
    public List<User> getAllUsers() {
        Criteria criteria = getSession().createCriteria(User.class);
        return (List<User>) criteria.list();
    }

    public void saveOrUpdate(User user) {
        getSession().saveOrUpdate(user);
    }

    public void create(User user) {
        getSession().save(user);
    }

    public void unlockByUsername(String username) {
        Query q = getSession().createQuery("UPDATE user SET locked=0 WHERE username=:username");
        q.setParameter("username", username);
        q.executeUpdate();
    }

    public void lockByUsername(String username) {
        Query q = getSession().createQuery("UPDATE user SET locked=1 WHERE username=:username");
        q.setParameter("username", username);
        q.executeUpdate();
    }

    public User getUserById(int id) {
        User user = (User) getSession().get(User.class, id);
        return user;
    }

    public void update(User user) {
        getSession().update(user);
    }

    public void lockByEmail(String email) {
    }

    public void unlockByEmail(String email) {
    }

    public void lockBySchoolEmail(String email) {
    }

    public void unlockBySchoolEmail(String email) {
    }

    public User findByEmail(String email) {
        Query q = getSession().createQuery("FROM user WHERE email=:email");
        q.setParameter("email", email);
        return (User) q.list().get(0);
    }

    public User findBySchoolEmail(String email) {
        Query q = getSession().createQuery("FROM user WHERE school_email=:email");
        q.setParameter("email", email);
        return (User) q.list().get(0);
    }

    public void deleteUser(int id) {
        User user = (User) getSession().get(User.class, id);
        getSession().delete(user);

    }

    public void updateAttemptedLogins(int attemptedLogins, String email) {

        Query q = getSession().createQuery("UPDATE user SET login_attempts=:attemptedLogins WHERE email=:email");
        q.setParameter("attemptedLogins", attemptedLogins);
        q.setParameter("email", email);
        q.executeUpdate();
    }

    public void updateIsActive(int isActive, String email) {

        Query q = getSession().createQuery("UPDATE user SET active=:isActive WHERE email=:email");
        q.setParameter("isActive", isActive);
        q.setParameter("email", email);
        q.executeUpdate();
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<User> getRecentUsers() {
        Query q = getSession().createQuery("FROM user ORDER BY date_created DESC");
        List<User> list = (List<User>) q.list();
        Iterator<User> it = list.iterator();
        List<User> recentListings = new ArrayList<User>();

        while (it.hasNext()) {

            User usr = it.next();
            recentListings.add(usr);

        }

        return recentListings;
    }

    @SuppressWarnings("unchecked")
    public List<User> soundexSearch(String search) {
        Query q = getSession().createSQLQuery("SELECT * FROM ulistit.user WHERE SOUNDEX(first_name)=soundex('" + search
                + "') OR SOUNDEX(last_name)=soundex('" + search + "') OR SOUNDEX(username)=soundex('" + search
                + "') OR SOUNDEX(school_email)=soundex('" + search + "');");
        return (List<User>) q.list();
    }

    @Override
    public List<User> soundexResults() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<User> getListingLosers(int listingID, int winnerID) {
        Query q = getSession().createSQLQuery("SELECT * FROM user WHERE user_ID IN (SELECT user_id FROM listing_bid WHERE listing_id=:listingID AND user_id !=:winnerID);")
                .addEntity(User.class);
        q.setParameter("listingID", listingID);
        q.setParameter("winnerID", winnerID);
        return q.list();
    }

    @Override
    public List<User> getDisputeResolvingAdmins() {
        return getSession().createQuery("FROM user WHERE admin_level = 3").list();
    }
}