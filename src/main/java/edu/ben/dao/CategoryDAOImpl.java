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
    public List getSubCategoriesByListingId(int id) {
        Query q = getSession().createSQLQuery("SELECT c.sub_category FROM category as c INNER JOIN ON c.category=l.category listing as l WHERE l.id=:id")
                .addEntity(String.class);
        q.setParameter("id", id);
        return q.list();
    }

    @Override
    public List getSubCategoriesByCategory(String cat) {
        Query q = getSession().createSQLQuery("SELECT sub_category FROM category WHERE cat=:cat")
                .addEntity(String.class);
        q.setParameter("cat", cat);
        return q.list();
    }

    @Override
    public void save(Category category) {
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
