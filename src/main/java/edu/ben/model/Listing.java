package edu.ben.model;

import javax.persistence.Column;

import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;


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
    @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	@Column(name = "name")
	@NotBlank
	private String name;

	@Column(name = "description")
	private String description;

	@Column(name = "price")
	private double price;

	@Column(name = "category")
	@NotBlank
	private String category;

	@Column(name = "image_path")
	private String image_path;
	
	@OneToOne
	@JoinColumn(name="userID")
	private User user;
	
	
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

}
