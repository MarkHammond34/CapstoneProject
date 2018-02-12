package edu.ben.service;

import java.util.List;

import edu.ben.model.SubCategory;

public interface SubCategoryService {

	public void createSubCategory(SubCategory subCategory);

	public void saveOrUpdate(SubCategory subCategory);

	public void deleteSubCategory(SubCategory subCategory);

	public List<SubCategory> getSubCategoriesByCategoryName(String categoryName);
}
