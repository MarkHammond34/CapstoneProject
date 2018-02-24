package edu.ben.service;

import java.sql.Timestamp;
import java.util.List;

import javax.transaction.Transactional;

import edu.ben.dao.UserDAO;
import edu.ben.model.Listing;
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
	public int placeBid(int biddingUserID, double bidValue, Listing listing) {

		if (System.currentTimeMillis() > listing.getEndTimestamp().getTime()) {
			return -1;
		} else if (bidValue <= listing.getHighestBid()) {
			ld.insertListingBid(listing.getId(), biddingUserID);
			return -2;
		} else if (biddingUserID == listing.getUser().getUserID()) {
			return -3;
		}
		ld.insertListingBid(listing.getId(), biddingUserID);

		// If current highest bidder is getting outbid, send notification
		if (biddingUserID != listing.getHighestBidder().getUserID()) {
			notificationService.save(new Notification(listing.getHighestBidder(), listing.getId(),
					"You've Be Outbit! Listing: " + listing.getName(),
					new Timestamp(System.currentTimeMillis() + 10000), 1));
		}

		listing.setHighestBid(bidValue);
		listing.setHighestBidder(ud.getUserById(biddingUserID));
		listing.setBidCount(listing.getBidCount() + 1);

		ld.saveOrUpdate(listing);
		return 1;
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
		return ld.getAllWeeklyPlusListings();
	}

	@Override
	public List<Listing> getAllFixedListings() {
		return ld.getAllFixedListings();
	}

	@Override
	public List<Listing> getAllDailyListings() {
		return ld.getAllDailyListings();
	}

	@Override
	public List<Listing> getAllWeeklyListings() {
		return ld.getAllWeeklyListings();
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
