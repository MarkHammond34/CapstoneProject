package edu.ben.model;


import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;

@Entity(name = "image")
@Table(name = "image")
@Transactional
public class Image {
    @Id
    @Column(name = "idimage")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Column(name = "user_Id")
    private int user;

    @Column(name = "listing_Id")
    private int listing;

    @Column(name = "image_path")
    private String image_path;

    @Column(name = "image_name")
    private String image_name;

    @Column(name = "main")
    private int main;

    public Image() {

    }

    public Image(int user,int listing, String image_path, String image_name, int main) {
        this.user = user;
        this.listing = listing;
        this.image_path = image_path;
        this.image_name = image_name;
        this.main = main;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser() { return user; }

    public void setUser(int user) { this.user = user; }

    public int getListing() {
        return listing;
    }

    public void setListing(int listing) {
        this.listing = listing;
    }

    public String getImage_path() {
        return image_path;
    }

    public void setImage_path(String image_path) {
        this.image_path = image_path;
    }

    public String getImage_name() {
        return image_name;
    }

    public void setImage_name(String image_name) {
        this.image_name = image_name;
    }

    public int getMain() {
        return main;
    }

    public void setMain(int main) {
        this.main = main;
    }
}
