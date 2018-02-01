package edu.ben.dao;

import java.util.ArrayList;
import java.util.List;

import edu.ben.model.Listing;

public interface ListingDAO {
	
	public void deleteListing(int id);

	public void saveOrUpdate(Listing listing);

	public void create(Listing listing);
	
	public List<Listing> getAllListingsByCategory(String category);

	public List<Listing> getRecentListings();
	
	public List<Listing> getAllListingsByUserID(int userID);
	
	public List<Listing> searchCategory(String category);
	
	
}