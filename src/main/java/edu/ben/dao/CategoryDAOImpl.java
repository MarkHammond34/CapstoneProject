package edu.ben.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.ben.model.Category;

@Transactional
@Repository
public class CategoryDAOImpl implements CategoryDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Category> getCategoriesByListingId(int id) {

		Query q = getSession().createQuery("FROM category WHERE listing_ID=:id");
		q.setInteger("id", id);
		List<Category> categories = q.list();
		return categories;
		
	}

	@Override
	public void createCategory(Category category) {
		
		getSession().save(category);
		
	}

	@Override
	public void saveOrUpdate(Category category) {
		
		getSession().saveOrUpdate(category);
		
	}

	@Override
	public void deleteCategory(String category) {
		
		getSession().delete(category);
		
	}

}
