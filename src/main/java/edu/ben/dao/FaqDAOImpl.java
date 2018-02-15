package edu.ben.dao;

import edu.ben.model.FaqAnswer;
import edu.ben.model.FaqQuestion;
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
    public List getAllQuestions() {
        return getSession().createQuery("FROM faq_question").list();
    }

    @Override
    public void saveQuestion(FaqQuestion q) {
        getSession().save(q);
    }

    @Override
    public void saveAnswer(FaqAnswer a) {
        getSession().save(a);
    }

    @Override
    public void updateQuestion(FaqQuestion q) {
        getSession().update(q);
    }

    @Override
    public void updateAnswer(FaqAnswer a) {
        getSession().update(a);
    }
}
