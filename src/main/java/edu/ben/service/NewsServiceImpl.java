package edu.ben.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ben.dao.NewsDAO;
import edu.ben.model.News;

@Service
@Transactional
public class NewsServiceImpl implements NewsService {
 
	NewsDAO nd;
	
	@Autowired
	public void setNewsDAO(NewsDAO nd) {
		this.nd = nd;
	}

	@Override
	public void delete(int id) {
		nd.delete(id);
		
	}

	@Override
	public void saveOrUpdate(News news) {
		nd.saveOrUpdate(news);
		
	}

	@Override
	public void create(News news) {
		nd.create(news);
		
	}
}
