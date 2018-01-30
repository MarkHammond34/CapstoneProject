package edu.ben.dao;

import edu.ben.model.Listing;

public interface ListingDAO {
	
	public void deleteListing(int id);

	public void saveOrUpdate(Listing listing);

	public void create(Listing listing);

}
