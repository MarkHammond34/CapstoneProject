package edu.ben.dao;

import java.util.List;

import edu.ben.model.Category;

public interface CategoryDAO {

	public void createCategory(Category category);
	
	public void saveOrUpdate(Category category);
	
	public void deleteCategory(String category);

	List<Category> getCategoriesByListingId(int id);

}
