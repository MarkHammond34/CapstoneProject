package edu.ben.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.transaction.annotation.Transactional;

@Entity(name = "transaction")
@Table(name = "transaction")
@Transactional
public class Transaction {

	@Id
	@Column(name = "transaction_ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name="buyer_ID")
	private int buyerID;

	@Column(name="seller_ID")
	private int sellerID;

	@OneToOne
	@JoinColumn(name = "listing_ID")
	private Listing listingID;

	@Column(name = "transaction_type")
	// @NotBlank
	private String transactionType;

	@Column(name = "completed")
	//@NotBlank
	private int completed;

	@OneToOne
	@JoinColumn(name = "offer_ID")
	private Offer offerID;
	
	@Column(name = "date_modified")
    private Timestamp dateModified;

    @Column(name = "date_created")
    private Timestamp dateCreated;

	public Transaction() {

	}
	
	public Transaction(int buyer, int seller, Listing listingID, Offer offerID) {
		this.buyerID = buyer;
		this.sellerID = seller;
		this.listingID = listingID;
		this.offerID = offerID;
	}
	
	public Transaction(int buyer, int seller, Listing listingID, int completed, Offer offerID) {
		this.buyerID = buyer;
		this.sellerID = seller;
		this.listingID = listingID;
		this.completed = completed;
		this.offerID = offerID;
	}

	public Transaction(int id, int buyer, int seller, Listing listingID, int completed, Offer offerID) {
		this.id = id;
		this.buyerID = buyer;
		this.sellerID = seller;
		this.listingID = listingID;
		this.completed = completed;
		this.offerID = offerID;
	}

	public Transaction(int id, int buyer, int seller, Listing listingID, String transactionType, int completed,
			Offer offerID) {
		this.id = id;
		this.buyerID = buyer;
		this.sellerID = seller;
		this.listingID = listingID;
		this.transactionType = transactionType;
		this.completed = completed;
		this.offerID = offerID;
	}

	// Getters and setters

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getBuyerID() {
		return buyerID;
	}

	public void setBuyerID(int buyerID) {
		this.buyerID = buyerID;
	}

	public int getSellerID() {
		return sellerID;
	}

	public void setSellerID(int sellerID) {
		this.sellerID = sellerID;
	}

	public Listing getListingID() {
		return listingID;
	}

	public void setListingID(Listing listingID) {
		this.listingID = listingID;
	}

	public String getTransactionType() {
		return transactionType;
	}

	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}

	public int getCompleted() {
		return completed;
	}

	public void setCompleted(int completed) {
		this.completed = completed;
	}

	public Offer getOfferID() {
		return offerID;
	}

	public void setOfferID(Offer offerID) {
		this.offerID = offerID;
	}

	public Timestamp getDateModified() {
		return dateModified;
	}

	public void setDateModified(Timestamp dateModified) {
		this.dateModified = dateModified;
	}

	public Timestamp getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Timestamp dateCreated) {
		this.dateCreated = dateCreated;
	}

}
