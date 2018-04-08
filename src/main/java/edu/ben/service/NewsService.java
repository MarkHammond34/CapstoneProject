package edu.ben.service;

import edu.ben.model.News;

import java.util.List;

public interface NewsService {
	public void delete(int id);

	public void saveOrUpdate(News news);

	public void create(News news);

	public List getAllArticles();
}
