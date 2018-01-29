package edu.ben.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.ben.model.User;

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
        Query q = getSession().createQuery("UPDATE user SET active=1 WHERE username=:username");
        q.setParameter("username", username);
        q.executeUpdate();
    }

    public void lockByUsername(String username) {
        Query q = getSession().createQuery("UPDATE user SET active=0 WHERE username=:username");
        q.setParameter("username", username);
        q.executeUpdate();
    }

    public User getUserById(int id) {
        User user = (User) getSession().get(User.class, id);
        return user;
    }

    public void update(User user) {
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
        return null;
    }

    public User findBySchoolEmail(String email) {
        return null;
    }

    public void deleteUser(int id) {
        User user = (User) getSession().get(User.class, id);
        getSession().delete(user);

    }

}
