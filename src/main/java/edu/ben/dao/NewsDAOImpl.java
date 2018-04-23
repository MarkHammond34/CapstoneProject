package edu.ben.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.ben.model.News;

import java.util.List;

@Transactional
@Repository
public class NewsDAOImpl implements NewsDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public void delete(int id) {
		News n = (News) getSession().get(News.class, id);
		getSession().delete(n);
		
	}

	@Override
	public void saveOrUpdate(News news) {
		getSession().saveOrUpdate(news);
		
	}

	@Override
	public void create(News news) {
		getSession().save(news);
		
	}

	@Override
	public News getArticleByID(int id) {
		Query q = getSession().createQuery("FROM news WHERE newsID=:id");
		q.setParameter("id", id);

		return (News) q.uniqueResult();
	}

	@Override
	public List getAllArticles() {
		Query q = getSession().createQuery("FROM news");

		if (q.list() != null) {
			return q.list();
		} else {
			return null;
		}
	}

}
