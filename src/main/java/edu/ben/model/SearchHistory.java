package edu.ben.model;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import java.sql.Timestamp;

public class SearchHistory {

    @Id
    @Column(name = "search_id")
    private int searchID;

    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;

    @Column(name = "search")
    private String search;

    @Column(name = "date_created")
    private Timestamp dateCreatd;

    @Column(name = "search_count")
    private int searchCount;

    public SearchHistory(User user, String search) {
        this.user = user;
        this.search = search;
    }

    public int getSearchID() {
        return searchID;
    }

    public void setSearchID(int searchID) {
        this.searchID = searchID;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getSearch() {
        return search;
    }

    public void setSearch(String search) {
        this.search = search;
    }

    public Timestamp getDateCreatd() {
        return dateCreatd;
    }

    public void setDateCreatd(Timestamp dateCreatd) {
        this.dateCreatd = dateCreatd;
    }

    public int getSearchCount() {
        return searchCount;
    }

    public void setSearchCount(int searchCount) {
        this.searchCount = searchCount;
    }
}
