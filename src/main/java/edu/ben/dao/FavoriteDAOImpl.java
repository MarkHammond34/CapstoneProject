package edu.ben.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.ben.model.Listing;

@Transactional
@Repository
public class FavoriteDAOImpl implements FavoriteDAO {

	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public int watchListing(int listingID, int userID) {
		Query query = getSession().createSQLQuery(
				"INSERT INTO ulistit.favorite(userID, listingID) VALUES (" + userID + ", " + listingID + ")");
		int result = query.executeUpdate();

		return result;
	}

	@Override
	public int unwatchListing(int listingID, int userID) {
		Query query = getSession().createQuery("delete from favorite where userID= :userID AND listingID= :listingID");
		query.setParameter("listingID", listingID);
		query.setParameter("userID", userID);
		int result = query.executeUpdate();
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Listing> isWatched(int listingID, int userID) {
		Query query = getSession().createQuery("from favorite where userID=:userID AND listingID=:listingID");
		query.setParameter("userID", userID);
		query.setParameter("listingID", listingID);
		return (List<Listing>) query.list();
		
	
	}

}
