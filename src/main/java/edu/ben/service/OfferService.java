package edu.ben.service;

import java.util.List;

import edu.ben.model.Offer;

public interface OfferService {
	
	public void createOffer(Offer offer);
	
	public void saveOrUpdate(Offer offer);
	
	public void deleteOffer(Offer offer);

	public Offer getOfferByUserId(int id);
	
	public List<Offer> getOffersById(int id);
	
}
