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

}
