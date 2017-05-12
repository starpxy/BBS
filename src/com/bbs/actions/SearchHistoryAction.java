package com.bbs.actions;

import com.bbs.entities.SearchHistory;
import com.bbs.entities.User;
import com.bbs.services.SearchHistoryService;
import com.opensymphony.xwork2.ModelDriven;

public class SearchHistoryAction extends BaseAction implements ModelDriven<SearchHistory> {
	private static final long serialVersionUID = 1L;
	private SearchHistory searchHistory;
	private SearchHistoryService searchHistoryService;

	public void setSearchHistoryService(SearchHistoryService searchHistoryService) {
		this.searchHistoryService = searchHistoryService;
	}

	public String searchBooks() {
		if (session.get("user") != null && searchHistory != null) {
			searchHistory.setUser((User) session.get("user"));
		}
		request.put("books", searchHistoryService.searchBooks(searchHistory));
		return "search";
	}

	public void prepareSearchBooks() {
		searchHistory = new SearchHistory();
	}

	@Override
	public SearchHistory getModel() {
		// TODO Auto-generated method stub
		return searchHistory;
	}

}
