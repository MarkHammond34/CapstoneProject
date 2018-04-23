package edu.ben.dao;

import edu.ben.model.News;

import java.util.List;

public interface NewsDAO {
	public void delete(int id);

	public void saveOrUpdate(News news);

	public void create(News news);

	public News getArticleByID(int id);

	public List getAllArticles();
}
