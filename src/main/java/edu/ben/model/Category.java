package edu.ben.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.transaction.Transactional;

@Entity(name = "category")
@Table(name = "category")
@Transactional
public class Category {

	@Id
	@Column(name = "category")
	private String category;

	@Column
	private String subCategory;

	@Column
	private int listingID;

	public Category(String category, String subCategory, int listingID) {
		this.category = category;
		this.subCategory = subCategory;
		this.listingID = listingID;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public int getListingID() {
		return listingID;
	}

	public void setListingID(int listingID) {
		this.listingID = listingID;
	}
}
