package edu.ben.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.ben.model.SubCategory;

@Transactional
@Repository
public class SubCategoryDAOImpl implements SubCategoryDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public void createSubCategory(SubCategory subCategory) {
		getSession().save(subCategory);
	}

	@Override
	public void saveOrUpdate(SubCategory subCategory) {
		getSession().saveOrUpdate(subCategory);
	}

	@Override
	public void deleteSubCategory(SubCategory subCategory) {
		getSession().delete(subCategory);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<SubCategory> getSubCategoriesByCategoryName(String categoryName) {
		
		Query q = getSession().createQuery("FROM sub_category WHERE category_name=:categoryName");
		q.setString("categoryName", categoryName);
		List<SubCategory> subCategories = q.list();
		return subCategories;
		
	}

}
