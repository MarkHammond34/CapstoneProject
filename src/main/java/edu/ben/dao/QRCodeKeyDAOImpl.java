package edu.ben.dao;

import edu.ben.model.QRCodeKey;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QRCodeKeyDAOImpl implements QRCodeKeyDAO {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void save(QRCodeKey key) {
        getSession().save(key);
    }

    @Override
    public void update(QRCodeKey key) {
        getSession().update(key);
    }

    @Override
    public QRCodeKey getByKey(String key) {
        Query q = getSession().createQuery("FROM qr_code_key WHERE key=:key");
        q.setParameter("key", key);
        return (QRCodeKey) q.list().get(0);
    }

    @Override
    public QRCodeKey getByPickUpID(int id) {
        Query q = getSession().createQuery("FROM qr_code_key WHERE pick_up_id=:id ORDER BY date_created DESC");
        q.setParameter("id", id);
        return (QRCodeKey) q.list().get(0);
    }
}
