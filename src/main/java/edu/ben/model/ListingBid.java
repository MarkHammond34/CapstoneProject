package edu.ben.model;

import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;

@Entity(name = "listing_bid")
@Table(name = "listing_bid")
@Transactional
public class ListingBid {

    @Id
    @Column(name = "bid_id")
    private int bid_id;

    @Column(name = "listing_id")
    private int listing_id;

    @Column(name = "user_id")
    private int user_id;

    @Column(name = "bid_value")
    private int bidValue;

    @Column(name = "active")
    private int active;

    public ListingBid() {
    }

    public ListingBid(int listingID, int userID, int bidValue) {
        this.listing_id = listingID;
        this.user_id = userID;
        this.bidValue = bidValue;
    }

    public int getListingID() {
        return listing_id;
    }

    public void setListingID(int listingID) {
        this.listing_id = listingID;
    }

    public int getUserID() {
        return user_id;
    }

    public void setUserID(int userID) {
        this.user_id = userID;
    }

    public int getBidID() {
        return bid_id;
    }

    public void setBidID(int bidID) {
        this.bid_id = bid_id;
    }

    public int getBidValue() {
        return bidValue;
    }

    public void setBidValue(int bidValue) {
        this.bidValue = bidValue;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }
}
