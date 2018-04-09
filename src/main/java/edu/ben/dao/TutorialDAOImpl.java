package edu.ben.dao;

import edu.ben.model.Tutorial;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public class TutorialDAOImpl implements TutorialDAO {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public int save(Tutorial tutorial) {
        return (int) getSession().save(tutorial);
    }

    @Override
    public void update(Tutorial tutorial) {
        getSession().update(tutorial);
    }
}
