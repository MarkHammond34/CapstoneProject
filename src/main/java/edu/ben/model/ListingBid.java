package edu.ben.model;

import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;

@Entity(name = "listing_bid")
@Table(name = "listing_bid")
@Transactional
public class ListingBid {

    @Id
    @Column(name = "bid_id")
    private int bidID;

    @Column(name = "listing_id")
    private int listingID;

    @Column(name = "user_id")
    private int userID;

    @Column(name = "bid_value")
    private int bidValue;

    @Column(name = "active")
    private int active;

    public ListingBid() {
    }

    public ListingBid(int listingID, int userID, int bidValue) {
        this.listingID = listingID;
        this.userID = userID;
        this.bidValue = bidValue;
    }

    public int getListingID() {
        return listingID;
    }

    public void setListingID(int listingID) {
        this.listingID = listingID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getBidID() {
        return bidID;
    }

    public void setBidID(int bidID) {
        this.bidID = bidID;
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
