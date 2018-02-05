package edu.ben.service;

import java.util.List;

import edu.ben.model.Listing;

public interface FavoriteService {
	
	public int watchListing(int listingID, int userID);
	
	public int unwatchListing(int listingID, int userID);
	
	public List isWatched(int listingID, int userID);

}
