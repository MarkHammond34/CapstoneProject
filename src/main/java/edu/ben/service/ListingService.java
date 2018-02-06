package edu.ben.service;

import edu.ben.model.Listing;

import java.util.List;

public interface ListingService {

    public void deleteListing(int id);

    public void saveOrUpdate(Listing listing);

    public void create(Listing listing);

    public List<Listing> getAllListingsByCategory(String category);

    public List<Listing> getRecentListings();

    public List<Listing> getListingsByBidCount();

    public Listing getByListingID(int listingID);

    public int placeBid(int biddingUserID, double bidValue, Listing listing);

    public List<Listing> getAllListingsByUserID(int userID);

    public void updateListingActiveStatusByID(int active, int id);

    public List<Listing> getActiveListingsUserBidOn(int userID);

    public List<Listing> getListingsLost(int userID);

    public List<Listing> getListingsWon(int userID);
}
