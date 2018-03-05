package edu.ben.dao;

import edu.ben.model.PickUp;
import org.hibernate.Query;
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

    @Override
    public PickUp getPickUpByListingID(int id) {
        Query q = getSession().createQuery("FROM pick_up WHERE listing_id=:id");
        q.setParameter("id", id);
        return (PickUp) q.list().get(0);
    }

    @Override
    public PickUp getPickUpByPickUpID(int id) {
        Query q = getSession().createQuery("FROM pick_up WHERE pick_up_id=:id");
        q.setParameter("id", id);
        return (PickUp) q.list().get(0);
    }
}
