package edu.ben.dao;

import edu.ben.model.Location;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class LocationDAOImpl implements LocationDAO {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void save(Location location) {
        getSession().save(location);
    }

    @Override
    public void update(Location location) {
        getSession().update(location);
    }

    @Override
    public List getAllSafeZones() {
        return getSession().createQuery("FROM pick_up_location WHERE active=1 AND safe_zone=1").list();
    }

    @Override
    public Location getByName(String name) {
        Query q = getSession().createQuery("FROM pick_up_location WHERE name=:name");
        q.setParameter("name", name);
        return (Location) q.list().get(0);
    }
}
