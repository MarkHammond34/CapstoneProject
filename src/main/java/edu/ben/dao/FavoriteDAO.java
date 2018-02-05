package edu.ben.dao;

import java.util.List;

import edu.ben.model.Listing;

public interface FavoriteDAO  {
	
	public int watchListing(int listingID, int userID);
	
	public int unwatchListing(int listingID, int userID);
	
	public List isWatched(int listingID, int userID);
	
}
