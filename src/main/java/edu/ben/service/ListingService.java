package edu.ben.service;

import java.util.List;

import edu.ben.model.Listing;

public interface ListingService {

	public void deleteListing(int id);

	public void saveOrUpdate(Listing listing);

	public void create(Listing listing);

	public List<Listing> getAllListingsByCategory(String category);

	public List<Listing> getRecentListings();

	public List<Listing> getListingsByBidCount();

	public Listing getByListingID(int listingID);

	public List<Listing> getAllListingsByUserID(int userID);

	public void updateListingActiveStatusByID(int active, int id);

	public List getListingsInProgressUserBidOn(int userID);

	public List getListingsLost(int userID);

	public List getListingsWon(int userID);

	public List getActiveListings();

	public List<Listing> getAllWeeklyPlusListings();

	public List<Listing> getAllFixedListings();

	public List<Listing> getAllDailyListings();

	public List<Listing> getAllWeeklyListings();

	public List<Listing> listingSearch(String search);

	public List<Listing> findAllDonatedListings();

	public List<Listing> findAllDonatedListingsByCategory(String category);

	public List<Listing> listingsSearchEndingLatest(String search);

	public List<Listing> listingsSearchEndingSoonest(String search);

	public List<Listing> listingSearchMostExpensive(String search);

	public List<Listing> listingSearchLeastExpensive(String search);

	public List getRelevantListingsByUserID(int userID);
}