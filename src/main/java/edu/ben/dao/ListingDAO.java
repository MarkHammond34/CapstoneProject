package edu.ben.dao;

import edu.ben.model.Listing;

import java.util.List;

public interface ListingDAO {

    public void deleteListing(int id);

    public void saveOrUpdate(Listing listing);

    public void create(Listing listing);

    public List<Listing> getAllListingsByCategory(String category);

    public List<Listing> getRecentListings();

    public List<Listing> getListingsByBidCount();

    public Listing getByListingID(int listingID);

    public List<Listing> getAllListingsByUserID(int userID);

    public List<Listing> searchCategory(String category);

    public void updateListingActiveStatusByID(int active, int id);

    public List getActiveListingsUserBidOn(int userID);

    public List getListingsLost(int userID);

    public List getListingsWon(int userID);

    public void insertListingBid(int listingID, int userID);

}
