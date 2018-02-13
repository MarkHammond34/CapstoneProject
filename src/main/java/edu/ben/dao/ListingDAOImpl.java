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

    @SuppressWarnings("unchecked")
    public List<Listing> getAllListingsByCategory(String category) {
        Query q = getSession().createSQLQuery(
                "SELECT * FROM ulistit.listing JOIN ulistit.category ON id=listing_ID WHERE category.category=:category")
                .addEntity(Listing.class);
        q.setParameter("category", category);
        return (List<Listing>) q.list();
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Listing> getRecentListings() {
        Query q = getSession().createQuery("FROM listing ORDER BY date_created DESC");
        List<Listing> list = (List<Listing>) q.list();
        Iterator<Listing> it = list.iterator();
        List<Listing> recentListings = new ArrayList<Listing>();

        while (it.hasNext()) {

            Listing listing = it.next();
            recentListings.add(listing);

        }

        return recentListings;
    }

    @Override
    public List<Listing> getListingsByBidCount() {
        Query q = getSession().createQuery("FROM listing WHERE bid_count > 0 ORDER BY bid_count");
        return (List<Listing>) q.list();
    }

    @Override
    public Listing getByListingID(int listingID) {
        Query q = getSession().createQuery("FROM listing WHERE id=:listingID");
        q.setParameter("listingID", listingID);
        return (Listing) q.list().get(0);
    }

    @SuppressWarnings("unchecked")
    public List<Listing> getAllListingsByUserID(int userID) {
        Query q = getSession().createSQLQuery("select * from ulistit.listing where userID = " + userID + ";")
                .addEntity(Listing.class);
        return (List<Listing>) q.list();

    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Listing> searchCategory(String category) {
        Query q = getSession()
                .createSQLQuery("SELECT * FROM ulistit.listing WHERE SOUNDEX(category)=soundex('" + category + "');");
        return (List<Listing>) q.list();
    }

    @Override
    public void updateListingActiveStatusByID(int active, int id) {

        Query q = getSession().createQuery("UPDATE listing SET active=:active WHERE id=:id");
        q.setParameter("active", active);
        q.setParameter("id", id);
        q.executeUpdate();

    }

    @Override
    public List getListingsInProgressUserBidOn(int userID) {
        Query q = getSession().createSQLQuery(
                "SELECT * FROM listing AS l WHERE l.ended=0 AND active=1 AND l.id IN (SELECT lb.listing_id FROM listing_bid AS lb WHERE lb.user_id=:userID)")
                .addEntity(Listing.class);
        q.setParameter("userID", userID);
        return q.list();
    }

    @Override
    public List getListingsLost(int userID) {
        Query q = getSession().createSQLQuery(
                "SELECT * FROM listing AS l WHERE l.ended=1 AND active=1 AND l.highest_bid_userID!=:userID AND l.id IN (SELECT lb.listing_id FROM listing_bid AS lb WHERE lb.user_id=:userID)")
                .addEntity(Listing.class);
        q.setParameter("userID", userID);
        return q.list();
    }

    @Override
    public List getListingsWon(int userID) {
        Query q = getSession().createSQLQuery("SELECT * FROM listing WHERE ended=1 AND active=1 AND highest_bid_userID=:userID")
                .addEntity(Listing.class);
        q.setParameter("userID", userID);
        return q.list();
    }

    @Override
    public void insertListingBid(int listingID, int userID) {
        Query q = getSession().createSQLQuery(
                "INSERT INTO listing_bid (listing_id, user_id) VALUES (:listingID, :userID) ON DUPLICATE KEY UPDATE listing_id=:listingID, user_id=:userID");
        q.setParameter("listingID", listingID);
        q.setParameter("userID", userID);
        q.executeUpdate();
    }

    @Override
    public List getActiveListings() {
        return getSession().createQuery("FROM listing WHERE active=1").list();
    }
}
