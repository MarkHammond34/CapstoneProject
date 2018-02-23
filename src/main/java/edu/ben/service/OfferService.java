package edu.ben.service;

import java.util.List;

import edu.ben.model.Offer;

public interface OfferService {
	
	public void createOffer(Offer offer);

	public void saveOrUpdate(Offer offer);

	public void deleteOffer(Offer offer);

	public List<Offer> getOffersByUserId(int id);
	
	public List<Offer> getActiveOffersByUserId(int id);

	public List<Offer> getOffersByListingId(int id);
	
	public List<Offer> getActiveOffersByListingId(int id);
	
	public Offer getOfferById(int id);
	
	public Offer getOfferByUserAndListingId(int userID, int listingID);
	
}
