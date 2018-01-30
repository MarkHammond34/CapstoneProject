package edu.ben.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ben.dao.ListingDAO;
import edu.ben.dao.UserDAO;
import edu.ben.model.Listing;

@Service
@Transactional
public class ListingServiceImpl implements ListingService {
	
	ListingDAO ld;
	
	@Autowired
	public void setListingDAO(ListingDAO ld) {
		this.ld = ld;
	}

	@Override
	public void deleteListing(int id) {
		ld.deleteListing(id);
	}

	@Override
	public void saveOrUpdate(Listing listing) {
		ld.saveOrUpdate(listing);
	}

	@Override
	public void create(Listing listing) {
		ld.create(listing);
	}

}
