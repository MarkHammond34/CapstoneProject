package edu.ben.service;

import java.util.List;

import edu.ben.model.Category;

public interface CategoryService {

    public void save(Category category);

    public void saveOrUpdate(Category category);

    public void deleteCategory(String category);

    List getSubCategoriesByListingId(int id);

    List getSubCategoriesByCategory(String cat);

}
