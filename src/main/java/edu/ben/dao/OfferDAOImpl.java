package edu.ben.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.ben.model.Offer;

@Transactional
@Repository
public class OfferDAOImpl implements OfferDAO {
	
	@Autowired
	SessionFactory sessionFactory;
	
	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public void createOffer(Offer offer) {
		getSession().save(offer);
	}

	@Override
	public void saveOrUpdate(Offer offer) {
		getSession().saveOrUpdate(offer);
	}

	@Override
	public void deleteOffer(Offer offer) {
		getSession().delete(offer);
	}

	@Override
	public Offer getOfferByUserId(int id) {
		
		Query q = getSession().createQuery("FROM offer WHERE user_id=:id");
		q.setParameter("id", id);
		
		return (Offer) q.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Offer> getOffersById(int id) {
		
		Query q = getSession().createQuery("FROM offer WHERE offer_id=:id");
		q.setParameter("id", id);
		
		return q.list();
	}

}
