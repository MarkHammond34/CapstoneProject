package edu.ben.dao;

import edu.ben.model.Faq;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Repository
public class FaqDAOImpl implements FaqDAO {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void save(Faq faq) {
        getSession().save(faq);
    }

    @Override
    public void update(Faq faq) {
        getSession().update(faq);
    }

    @Override
    public List getAllFaqs() {
        return getSession().createQuery("FROM faq").list();
    }
}
