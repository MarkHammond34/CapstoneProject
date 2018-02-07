package edu.ben.service;

import java.util.List;

import javax.transaction.Transactional;

import edu.ben.model.Listing;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ben.dao.ListingDAO;

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
        }
        ld.insertListingBid(listing.getId(), biddingUserID);

        listing.setHighestBid(bidValue);
        listing.setHighestBidUserID(biddingUserID);
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
    public List getActiveListingsUserBidOn(int userID) {
        return ld.getActiveListingsUserBidOn(userID);
    }

    @Override
    public List getListingsLost(int userID) {
        return ld.getListingsLost(userID);
    }

    @Override
    public List getListingsWon(int userID) {
        return ld.getListingsWon(userID);
    }

}
