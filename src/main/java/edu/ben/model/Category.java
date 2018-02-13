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
    @Column(name = "category")
    private String category;

    @Column(name = "sub_category")
    private String subCategories;

    public Category() {

    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getSubCategories() {
        return subCategories;
    }

    public void setSubCategories(String subCategories) {
        this.subCategories = subCategories;
    }

}
