package edu.ben.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.transaction.Transactional;

@Entity(name = "category")
@Table(name = "category")
@Transactional
public class Category {

	@Id
	@Column(name = "category_name")
	private String category;
	
	@OneToMany(targetEntity=SubCategory.class, mappedBy="category", fetch = FetchType.EAGER)
	private List<SubCategory> subCategories;
	
	public Category() {
		
	}

	public Category(String category, List<SubCategory> subCategories, int listingID) {
		this.category = category;
		this.subCategories = subCategories;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public List<SubCategory> getSubCategories() {
		return subCategories;
	}

	public void setSubCategories(List<SubCategory> subCategories) {
		this.subCategories = subCategories;
	}
	
}
