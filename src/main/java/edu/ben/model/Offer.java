package edu.ben.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.transaction.annotation.Transactional;

@Entity(name = "offer")
@Table(name = "offer")
@Transactional
public class Offer {

	@Id
	@Column(name = "offer_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int offerID;

	@Column(name = "offer_amount")
	private int offerAmount;

	@Column(name = "offer_message")
	private String offerMessage;

	@Column(name = "image_path")
	private String imagePath;

	@OneToOne
	@JoinColumn(name = "user_id")
	private User userID;
	
	@OneToOne
	@JoinColumn(name = "listing_id")
	private Listing listingID;
	
	@Column(name = "status")
	private String status;
	
	@Column(name = "active")
	private int active;
	
	public Offer() {
		
	}
	
	public Offer(int offerAmount, String offerMessage, User userID, Listing listingID) {
		this.offerAmount = offerAmount;
		this.offerMessage = offerMessage;
		this.userID = userID;
		this.listingID = listingID;
	}
	
	public Offer(int offerAmount, String offerMessage, User userID, Listing listingID, String status) {
		this.offerAmount = offerAmount;
		this.offerMessage = offerMessage;
		this.userID = userID;
		this.listingID = listingID;
		this.status = status;
	}
	
	public Offer(int offerAmount, String offerMessage, String imagePath, User userID, Listing listingID, String status) {
		this.offerAmount = offerAmount;
		this.offerMessage = offerMessage;
		this.imagePath = imagePath;
		this.userID = userID;
		this.listingID = listingID;
		this.status = status;
	}
	
	public Offer(int offerID, int offerAmount, String offerMessage, String imagePath, User userID, Listing listingID, String status) {
		this.offerID = offerID;
		this.offerAmount = offerAmount;
		this.offerMessage = offerMessage;
		this.userID = userID;
		this.listingID = listingID;
		this.status = status;
	}

	// Getters and setters

	public int getOfferID() {
		return offerID;
	}

	public void setOfferID(int offerID) {
		this.offerID = offerID;
	}

	public int getOfferAmount() {
		return offerAmount;
	}

	public void setOfferAmount(int offerAmount) {
		this.offerAmount = offerAmount;
	}

	public String getOfferMessage() {
		return offerMessage;
	}

	public void setOfferMessage(String offerMessage) {
		this.offerMessage = offerMessage;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public User getUserID() {
		return userID;
	}

	public void setUserID(User userID) {
		this.userID = userID;
	}

	public Listing getListingID() {
		return listingID;
	}

	public void setListingID(Listing listingID) {
		this.listingID = listingID;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}
}
