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

	@SuppressWarnings("unchecked")
	@Override
	public List<Offer> getOffersByUserId(int id) {
		
		Query q = getSession().createQuery("FROM offer WHERE user_id=:id");
		q.setParameter("id", id);
		
		return q.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Offer> getOffersByListingId(int id) {
		
		Query q = getSession().createQuery("FROM offer WHERE listing_id=:id");
		q.setParameter("id", id);
		
		return q.list();
	}

	@Override
	public Offer getOfferById(int id) {
		
		Query q = getSession().createQuery("FROM offer WHERE offer_id=:id");
		q.setParameter("id", id);
		
		return (Offer) q.list();
	}

	@Override
	public Offer getOfferByUserAndListingId(int userID, int listingID) {
		
		Query q = getSession().createQuery("FROM offer WHERE user_id=:userID AND listing_id=:listingID");
		q.setParameter("userID", userID);
		q.setParameter("listingID", listingID);
		
		return (Offer) q.list().get(0);
	}

}
