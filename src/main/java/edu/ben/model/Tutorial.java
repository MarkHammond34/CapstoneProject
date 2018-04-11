package edu.ben.model;

import javax.persistence.*;

@Table(name = "tutorial")
@Entity(name = "tutorial")
public class Tutorial {

    @Id
    @Column(name = "tutorial_id")
    private int user_id;

    @OneToOne(mappedBy="tutorial")
    private User user;

    @Column(name = "viewed_home")
    private int viewedHome;

    @Column(name = "viewed_listing")
    private int viewedListing;

    @Column(name = "viewed_dashboard")
    private int viewedDashboard;

    @Column(name = "viewed_checklist")
    private int viewedChecklist;

    @Column(name = "viewed_pickup")
    private int viewedPickup;

    @Column(name = "viewed_saved_search")
    private int viewedSavedSearch;

    @Column(name = "viewed_transaction_history")
    private int viewedTransactionHistory;

    public Tutorial() {
    }

    public Tutorial(int userID) {
        this.user_id = userID;
        this.viewedHome = 0;
        this.viewedListing = 0;
        this.viewedDashboard = 0;
        this.viewedChecklist = 0;
        this.viewedPickup = 0;
        this.viewedSavedSearch = 0;
        this.viewedTransactionHistory = 0;
    }

    public int getUserID() {
        return user_id;
    }

    public void setUserID(int user_id) {
        this.user_id = user_id;
    }

    public int getViewedHome() {
        return viewedHome;
    }

    public void setViewedHome(int viewedHome) {
        this.viewedHome = viewedHome;
    }

    public int getViewedListing() {
        return viewedListing;
    }

    public void setViewedListing(int viewedListing) {
        this.viewedListing = viewedListing;
    }

    public int getViewedDashboard() {
        return viewedDashboard;
    }

    public void setViewedDashboard(int viewedDashboard) {
        this.viewedDashboard = viewedDashboard;
    }

    public int getViewedChecklist() {
        return viewedChecklist;
    }

    public void setViewedChecklist(int viewedChecklist) {
        this.viewedChecklist = viewedChecklist;
    }

    public int getViewedPickup() {
        return viewedPickup;
    }

    public void setViewedPickup(int viewedPickup) {
        this.viewedPickup = viewedPickup;
    }

    public int getViewedSavedSearch() {
        return viewedSavedSearch;
    }

    public void setViewedSavedSearch(int viewedSavedSearch) {
        this.viewedSavedSearch = viewedSavedSearch;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getViewedTransactionHistory() {
        return viewedTransactionHistory;
    }

    public void setViewedTransactionHistory(int viewedTransactionHistory) {
        this.viewedTransactionHistory = viewedTransactionHistory;
    }
}
