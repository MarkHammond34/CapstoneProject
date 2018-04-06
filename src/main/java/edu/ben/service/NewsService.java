package edu.ben.service;

import edu.ben.model.News;

public interface NewsService {
	public void delete(int id);

	public void saveOrUpdate(News news);

	public void create(News news);
}
