package com.bbs.services;

import java.util.List;
import java.util.Map;

import com.bbs.dao.SearchHistoryDao;
import com.bbs.entities.Book;
import com.bbs.entities.SearchHistory;
import com.bbs.entities.User;

public class SearchHistoryService {
	private SearchHistoryDao searchHistoryDao;

	public void setSearchHistoryDao(SearchHistoryDao searchHistoryDao) {
		this.searchHistoryDao = searchHistoryDao;
	}

	public List<Book> searchBooks(SearchHistory searchHistory,int page) {
		return searchHistoryDao.searchBooks(searchHistory,page);
	}

	public List<Book> bookSearch(SearchHistory searchHistory,int page) {
		return searchHistoryDao.bookSearch(searchHistory,page);
	}

	public List<String> checkSearchHistory(User user) {
		return searchHistoryDao.checkSearchHistory(user);
	}

	public Map<Book, List<Book>> recommendBook(User user) {
		return searchHistoryDao.recommendBook(user);
	}

}
