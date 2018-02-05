package edu.ben.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.transaction.annotation.Transactional;

@Entity(name = "favorite")
@Table(name = "favorite")
@Transactional
public class Favorite {
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Listing getListing() {
		return listing;
	}

	public void setListing(Listing listing) {
		this.listing = listing;
	}

	@Id
	@Column
	private int id;
	
	@OneToOne
	@JoinColumn(name="userID")
	private User user;
	
	@OneToOne
	@JoinColumn(name="listingID")
	private Listing listing;

}
