package edu.ben.model;

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

@Entity(name="transaction")
@Table(name="transaction")
@Transactional
public class Transaction {

	@Id
	@Column(name="transaction_ID")
    @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@Column(name="")
	@NotBlank
	private int buyerID;
	
	@Column(name="")
	@NotBlank
	private int sellerID;
	
	@Column(name="")
	@NotBlank
	private int listingID;
	
	@Column(name="")
	@NotBlank
	private String transactionType;
	
	@OneToOne
	@JoinColumn(name="user_ID")
	private int userID; // Maybe change to User object
	
	@Column(name="")
	@NotBlank
	private int completed;
	
	// Getters and sources

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

	public int getListingID() {
		return listingID;
	}

	public void setListingID(int listingID) {
		this.listingID = listingID;
	}

	public String getTransactionType() {
		return transactionType;
	}

	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public int getCompleted() {
		return completed;
	}

	public void setCompleted(int completed) {
		this.completed = completed;
	}

}
