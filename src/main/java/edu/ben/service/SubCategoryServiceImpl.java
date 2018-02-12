package edu.ben.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ben.dao.SubCategoryDAO;
import edu.ben.model.SubCategory;

@Transactional
@Service
public class SubCategoryServiceImpl implements SubCategoryService {

	SubCategoryDAO subCategoryDAO;

	@Autowired
	public void setSubCategoryDAO(SubCategoryDAO subCategoryDAO) {
		this.subCategoryDAO = subCategoryDAO;
	}

	@Override
	public void createSubCategory(SubCategory subCategory) {
		subCategoryDAO.createSubCategory(subCategory);
	}

	@Override
	public void saveOrUpdate(SubCategory subCategory) {
		subCategoryDAO.saveOrUpdate(subCategory);
	}

	@Override
	public void deleteSubCategory(SubCategory subCategory) {
		subCategoryDAO.deleteSubCategory(subCategory);
	}

	@Override
	public List<SubCategory> getSubCategoriesByCategoryName(String categoryName) {
		return subCategoryDAO.getSubCategoriesByCategoryName(categoryName);
	}

}
