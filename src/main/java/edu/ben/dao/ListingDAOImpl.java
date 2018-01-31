package edu.ben.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.ben.model.Listing;
import edu.ben.model.User;

@Transactional
@Repository
public class ListingDAOImpl implements ListingDAO {
	
	@Autowired
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }
    
    public void create(Listing listing) {
        getSession().save(listing);
    }
    
    public void saveOrUpdate(Listing listing) {
        getSession().saveOrUpdate(listing);
    }
    
    public void deleteListing(int id) {
        Listing listing = (Listing) getSession().get(Listing.class, id);
        getSession().delete(listing);

    }

	@Override
	public List<Listing> getRecentListings() {
		Query q = getSession().createQuery("FROM listing ORDER BY date_created DESC");
		List<Listing> list = q.list();
		System.out.println(list.get(0));
		Iterator<Listing> it = list.iterator();
		List<Listing> recentListings = new ArrayList<Listing>();
		
		while (it.hasNext()) {
			
			Listing listing = it.next();
			recentListings.add(listing);
			
		} 
		
        return recentListings;
	}

}
