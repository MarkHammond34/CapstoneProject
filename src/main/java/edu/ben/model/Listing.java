package edu.ben.model;

import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.sql.Timestamp;
import java.util.Date;

//import com.sun.istack.internal.Nullable;


@Entity(name = "listing")
@Table(name = "listing")
@Transactional
public class Listing implements java.io.Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;

    @OneToOne
    @JoinColumn(name="userID")
    private User user;

    @Column(name="name")
    @NotBlank
    private String name;

    @Column(name="description")
    private String description;

    @Column(name="category")
    @NotBlank
    private String category;

    @Column(name="price")
    private double price;

    @Column(name="date_created")
    private Date dateCreated;

    @Column(name = "type")
    public String type;

    @Column(name="image_path")
    private String image_path;

    @Column(name="highest_bid_userID")
//	@Nullable
    private int highestBidUserID;

    @Column(name="highest_bid")
//	@Nullable
    private Double highestBid;

    @Column(name="bid_count")
//	@Nullable
    private int bidCount;

    @Column(name="start_timestamp")
    private Timestamp startTimestamp;

    @Column(name="end_timestamp")
    private Timestamp endTimestamp;


    public String getImage_path() {
        return image_path;
    }

    public void setImage_path(String image_path) {
        this.image_path = image_path;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Listing() {

    }

    public Listing(@NotBlank int id, @NotBlank String name, String description, @NotBlank double price,
                   @NotBlank String category, String imagePath) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.category = category;
        this.image_path = imagePath;
    }

    public Listing(@NotBlank String name, String description, @NotBlank double price, @NotBlank String category,
                   String file) {
        super();
        this.name = name;
        this.description = description;
        this.price = price;
        this.category = category;
        this.image_path = file;
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

    public String getImagePath() {
        return image_path;
    }

    public void setImagePath(String imagePath) {
        this.image_path = imagePath;
    }

    @Override
    public String toString() {
        return "Listing [id=" + id + ", name=" + name + ", description=" + description + ", category=" + category
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

    public int getHighestBidUserID() {
        return highestBidUserID;
    }

    public void setHighestBidUserID(int highestBidUserID) {
        this.highestBidUserID = highestBidUserID;
    }

    public Double getHighestBid() {
        return highestBid;
    }

    public void setHighestBid(Double highestBid) {
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
}
