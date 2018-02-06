package edu.ben.model;

import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;

@Entity(name = "listing_bid")
@Table(name = "listing_bid")
@Transactional
public class ListingBid {

    @Column(name = "listing_id")
    @Id
    private int listingID;

    @Column(name = "user_id")
    private int userID;

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
}
