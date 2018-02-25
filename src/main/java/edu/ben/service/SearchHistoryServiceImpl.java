package edu.ben.service;

import edu.ben.dao.SearchHistoryDAO;
import edu.ben.model.SearchHistory;
import edu.ben.model.Subcategory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class SearchHistoryServiceImpl implements SearchHistoryService {

    SearchHistoryDAO searchHistoryDAO;

    @Autowired
    public void setSearchHistoryDAO(SearchHistoryDAO searchHistoryDAO) {
        this.searchHistoryDAO = searchHistoryDAO;
    }

    SubcategoryDAO subcategoryDAO;

    @Autowired
    public void setSubcategoryDAO(SubcategoryDAO subcategoryDAO) {
        this.subcategoryDAO = subcategoryDAO;
    }

    @Override
    public void save(SearchHistory searchHistory) {

        try {
            // If search already exists, update search count
            SearchHistory existingSearch = searchHistoryDAO.exists(searchHistory);
            existingSearch.setSearchCount(existingSearch.getSearchCount() + 1);
            searchHistoryDAO.update(existingSearch);

        } catch (IndexOutOfBoundsException e) {
            // If search does not exist, save
            searchHistoryDAO.save(searchHistory);
        }
    }

    @Override
    public List getAllSearchesByUserID(int userID) {
        return searchHistoryDAO.getAllSearchesByUserID(userID);
    }
}
