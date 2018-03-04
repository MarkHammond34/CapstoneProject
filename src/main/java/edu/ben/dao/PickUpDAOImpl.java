package edu.ben.dao;

import edu.ben.model.PickUp;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PickUpDAOImpl implements PickUpDAO {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void save(PickUp pickUp) {
        getSession().save(pickUp);
    }

    @Override
    public void update(PickUp pickUp) {
        getSession().update(pickUp);
    }
}
