package edu.ben.service;

import java.sql.Timestamp;
import java.util.List;

import javax.transaction.Transactional;

import edu.ben.dao.UserDAO;
import edu.ben.model.Listing;
import edu.ben.model.ListingBid;
import edu.ben.model.Notification;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ben.dao.ListingDAO;

@Service
@Transactional
public class ListingServiceImpl implements ListingService {

	ListingDAO ld;

	UserDAO ud;

	@Autowired
	public void setListingDAO(ListingDAO ld) {
		this.ld = ld;
	}

	@Autowired
	public void setUserDAO(UserDAO ud) {
		this.ud = ud;
	}

	NotificationService notificationService;

	@Autowired
	public void setNotificationService(NotificationService notificationService) {
		this.notificationService = notificationService;
	}


    ListingBidService listingBidService;

    @Autowired
    public void setListingBidService(ListingBidService listingBidService) {
        this.listingBidService = listingBidService;
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

	public List<Listing> getAllListingsByCategory(String category) {
		return ld.getAllListingsByCategory(category);
	}

	public List<Listing> getRecentListings() {
		return ld.getRecentListings();
	}

	@Override
	public List<Listing> getListingsByBidCount() {
		return ld.getListingsByBidCount();
	}

	@Override
	public Listing getByListingID(int listingID) {
		return ld.getByListingID(listingID);
	}


	@Override
	public List<Listing> getAllListingsByUserID(int userID) {
		return ld.getAllListingsByUserID(userID);
	}

	@Override
	public void updateListingActiveStatusByID(int active, int id) {
		ld.updateListingActiveStatusByID(active, id);
	}


	@Override
	public List getListingsInProgressUserBidOn(int userID) {
		return ld.getListingsInProgressUserBidOn(userID);
	}

	@Override
	public List getListingsLost(int userID) {
		return ld.getListingsLost(userID);
	}

	@Override
	public List getListingsWon(int userID) {
		return ld.getListingsWon(userID);
	}

	@Override
	public List getActiveListings() {
		return ld.getActiveListings();
	}

    @Override
    public List<Listing> getAllWeeklyPlusListings() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<Listing> getAllFixedListings() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<Listing> getAllDailyListings() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<Listing> getAllWeeklyListings() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List getRelevantListingsByUserID(int userID) {
        return ld.getRelevantListingsByUserID(userID);
    }

	@Override
	public List<Listing> listingSearch(String search) {
		return ld.listingSearch(search);
	}

	@Override
	public List<Listing> findAllDonatedListings() {
		return ld.findAllDonatedListings();
	}

	@Override
	public List<Listing> findAllDonatedListingsByCategory(String category) {
		return ld.findAllDonatedListingsByCategory(category);
	}

	@Override
	public List<Listing> listingsSearchEndingLatest(String search) {
		return ld.listingsSearchEndingLatest(search);
	}

	@Override
	public List<Listing> listingsSearchEndingSoonest(String search) {
		return ld.listingsSearchEndingSoonest(search);
	}

	@Override
	public List<Listing> listingSearchMostExpensive(String search) {
		return ld.listingSearchMostExpensive(search);
	}

	@Override
	public List<Listing> listingSearchLeastExpensive(String search) {
		return ld.listingSearchLeastExpensive(search);
	}

}
