package edu.ben.dao;

import edu.ben.model.News;

public interface NewsDAO {
	public void delete(int id);

	public void saveOrUpdate(News news);

	public void create(News news);
}
