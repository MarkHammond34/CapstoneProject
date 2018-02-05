package edu.ben.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.ben.model.Transaction;

@Transactional
@Repository
public class TransactionDAOImpl implements TransactionDAO {
	
	@Autowired
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

	@Override
	public Transaction getTransaction(int id) {
		Query q = getSession().createQuery("FROM transaction WHERE transaction_ID=:id");
		q.setParameter("id", id);
		return (Transaction) q.list().get(0);
	}

	@Override
	public void createTransaction(Transaction transaction) {
		getSession().save(transaction);
	}

	@Override
	public void saveOrUpdate(Transaction transaction) {
		getSession().saveOrUpdate(transaction);
	}

	@Override
	public void deleteTransaction(Transaction transaction) {
		getSession().delete(transaction);
	}

}

