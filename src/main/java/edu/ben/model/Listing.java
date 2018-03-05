package edu.ben.model;

import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import org.springframework.transaction.annotation.Transactional;

@Entity(name = "listing")
@Table(name = "listing")
@Transactional

public class Listing implements java.io.Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @OneToOne
    @JoinColumn(name = "userID")
    private User user;

    @Column(name = "name")
    @NotBlank
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "category")
    private String category;

    @Column(name = "price")
    private double price;

    @Column(name = "date_created")
    private Date dateCreated;

    @Column(name = "type")
    public String type;

    @Column(name = "image_path")
    private String image_path;

    @OneToOne
    @JoinColumn(name = "highest_bid_userID")
    private User highestBidder;

    @Column(name = "highest_bid")
    // @Nullable
    private Integer highestBid;

    @Column(name = "bid_count")
    // @Nullable
    private int bidCount;

    @Column(name = "start_timestamp")
    private Timestamp startTimestamp;

    @Column(name = "end_timestamp")
    private Timestamp endTimestamp;

    @Column(name = "ended")
    private int ended;

    @Column(name = "active")
    private int active;

    @Column(name = "premium")
    private int premium;

    public Listing() {
        this.highestBid = 0;
        this.bidCount = 0;
    }

    public Listing(@NotBlank int id, @NotBlank String name, String description, @NotBlank double price,
                   String imagePath) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        // this.category = category;
        this.image_path = imagePath;
        this.highestBid = 0;
        this.bidCount = 0;
    }

    public Listing(@NotBlank int id, @NotBlank String name, String description, @NotBlank double price, String category,
                   String imagePath) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.category = category;
        this.image_path = imagePath;
        this.highestBid = 0;
        this.bidCount = 0;
    }

    public Listing(@NotBlank String name, String description, @NotBlank double price, /* @NotBlank String category, */
                   String file) {
        super();
        this.name = name;
        this.description = description;
        this.price = price;
        // this.category = category;
        this.image_path = file;
        this.highestBid = 0;
        this.bidCount = 0;
    }

    public Listing(@NotBlank String name, String description, @NotBlank double price, @NotBlank String category,
                   String file) {
        super();
        this.name = name;
        this.description = description;
        this.price = price;
        this.category = category;
        this.image_path = file;
        this.highestBid = 0;
        this.bidCount = 0;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Listing [id=" + id + ", name=" + name + ", description=" + description + ", category=" /* + category */
                + ", price=" + price + ", dateCreated=" + dateCreated + ", image_path=" + image_path + ", user=" + user
                + "]";
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public User getHighestBidder() {
        return highestBidder;
    }

    public void setHighestBidder(User highestBidder) {
        this.highestBidder = highestBidder;
    }

    public int getHighestBid() {
        return highestBid;
    }

    public void setHighestBid(int highestBid) {
        this.highestBid = highestBid;
    }

    public int getBidCount() {
        return bidCount;
    }

    public void setBidCount(int bidCount) {
        this.bidCount = bidCount;
    }

    public Timestamp getStartTimestamp() {
        return startTimestamp;
    }

    public void setStartTimestamp(Timestamp startTimestamp) {
        this.startTimestamp = startTimestamp;
    }

    public Timestamp getEndTimestamp() {
        return endTimestamp;
    }

    public void setEndTimestamp(Timestamp endTimestamp) {
        this.endTimestamp = endTimestamp;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getImage_path() {
        return image_path;
    }

    public void setImage_path(String image_path) {
        this.image_path = image_path;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public int getEnded() {
        return ended;
    }

    public void setEnded(int ended) {
        this.ended = ended;
    }

    public long getDelay() {
        return endTimestamp.getTime() - System.currentTimeMillis();
    }

    public long getSecondsRemaining() {
        return (long) Math.floor(getDelay() / 1000);
    }

    public long getMinutesRemaining() {
        return (long) Math.floor(getDelay() / (60 * 1000));
    }

    public long getHoursRemaining() {
        return (long) Math.floor(getDelay() / (60 * 60 * 1000));
    }

    public long getDaysRemaining() {
        return (long) Math.floor(getDelay() / (24 * 60 * 60 * 1000));
    }

    public long getEndTimestampAsLong() {
        return endTimestamp.getTime();
    }

    public long getStartTimestampAsLong() {
        return startTimestamp.getTime();
    }

    public int getPremium() {
        return premium;
    }

    public void setPremium(int premium) {
        this.premium = premium;
    }

}
