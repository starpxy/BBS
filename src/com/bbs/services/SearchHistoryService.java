package com.bbs.services;

import java.util.List;

import com.bbs.dao.SearchHistoryDao;
import com.bbs.entities.Book;
import com.bbs.entities.SearchHistory;

public class SearchHistoryService {
	private SearchHistoryDao searchHistoryDao;
	public void setSearchHistoryDao(SearchHistoryDao searchHistoryDao) {
		this.searchHistoryDao = searchHistoryDao;
	}
	public List<Book> searchBooks(SearchHistory searchHistory){
		return searchHistoryDao.searchBooks(searchHistory);
	}
	

}
