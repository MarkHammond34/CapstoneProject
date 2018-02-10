package edu.ben.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ben.dao.CategoryDAO;
import edu.ben.model.Category;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {

	CategoryDAO categoryDAO;

	@Autowired
	public void setCategoryDAO(CategoryDAO categoryDAO) {
		this.categoryDAO = categoryDAO;
	}

	@Override
	public void createCategory(Category category) {
		categoryDAO.createCategory(category);
	}

	@Override
	public void saveOrUpdate(Category category) {
		categoryDAO.saveOrUpdate(category);
	}

	@Override
	public void deleteCategory(String category) {
		categoryDAO.deleteCategory(category);
	}

	@Override
	public List<Category> getCategoriesByListingId(int id) {
		return categoryDAO.getCategoriesByListingId(id);
	}

}
