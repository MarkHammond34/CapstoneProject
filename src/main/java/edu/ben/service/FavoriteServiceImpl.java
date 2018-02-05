package edu.ben.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ben.dao.FavoriteDAO;
import edu.ben.dao.ListingDAO;
import edu.ben.model.Listing;

@Service
@Transactional
public class FavoriteServiceImpl implements FavoriteService {
	
	FavoriteDAO fd;
	
	@Autowired
	public void setListingDAO(FavoriteDAO fd) {
		this.fd = fd;
	}

	@Override
	public int watchListing(int listingID, int userID) {
		fd.watchListing(listingID, userID);
		return 0;
	}

	@Override
	public int unwatchListing(int listingID, int userID) {
		fd.unwatchListing(listingID, userID);
		return 0;
	}

	@Override
	public List isWatched(int listingID, int userID) {
		return (List) fd.isWatched(listingID, userID);
		
	}

}
