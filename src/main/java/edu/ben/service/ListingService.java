package edu.ben.service;

import edu.ben.model.Listing;

public interface ListingService {

	public void deleteListing(int id);

	public void saveOrUpdate(Listing listing);

	public void create(Listing listing);
}
