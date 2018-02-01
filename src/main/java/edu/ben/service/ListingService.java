package edu.ben.service;

import java.util.List;

import edu.ben.model.Listing;

public interface ListingService {

	public void deleteListing(int id);

	public void saveOrUpdate(Listing listing);

	public void create(Listing listing);
	
	public List<Listing> getAllListingsByCategory(String category);
	
	public List<Listing> getRecentListings();

	public List<Listing> getAllListingsByUserID(int userID);
	
	public void updateListingActiveStatusByID(int active, int id);
}
