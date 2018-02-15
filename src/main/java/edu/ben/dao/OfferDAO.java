package edu.ben.dao;

import java.util.List;

import edu.ben.model.Offer;

public interface OfferDAO {

	public void createOffer(Offer offer);

	public void saveOrUpdate(Offer offer);

	public void deleteOffer(Offer offer);

	public Offer getOfferByUserId(int id);

	public List<Offer> getOffersById(int id);
	
}
