package edu.ben.dao;

import java.util.List;

import edu.ben.model.Category;

public interface CategoryDAO {

    public void save(Category category);

    public void saveOrUpdate(Category category);

    public void deleteCategory(String category);

    List getSubCategoriesByListingId(int id);

    List getSubCategoriesByCategory(String cat);

}
