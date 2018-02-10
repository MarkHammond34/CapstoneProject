package edu.ben.service;

import java.util.List;

import edu.ben.model.Category;

public interface CategoryService {

	public void createCategory(Category category);

	public void saveOrUpdate(Category category);

	public void deleteCategory(String category);

	List<Category> getCategoriesByListingId(int id);

}
