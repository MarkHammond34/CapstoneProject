package edu.ben.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import edu.ben.dao.OfferDAO;
import edu.ben.model.Offer;

@Service
@Transactional
public class OfferServiceImpl implements OfferService {
	
	OfferDAO offerDAO;

	@Override
	public void createOffer(Offer offer) {
		offerDAO.createOffer(offer);
	}

	@Override
	public void saveOrUpdate(Offer offer) {
		offerDAO.saveOrUpdate(offer);
	}

	@Override
	public void deleteOffer(Offer offer) {
		offerDAO.deleteOffer(offer);
	}

	@Override
	public Offer getOfferByUserId(int id) {
		return offerDAO.getOfferByUserId(id);
	}

	@Override
	public List<Offer> getOffersById(int id) {
		return offerDAO.getOffersById(id);
	}

}