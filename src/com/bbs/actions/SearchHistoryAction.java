package com.bbs.actions;

import java.util.HashMap;
import java.util.Map;

import com.bbs.entities.SearchHistory;
import com.bbs.entities.User;
import com.bbs.services.SearchHistoryService;
import com.opensymphony.xwork2.ModelDriven;

public class SearchHistoryAction extends BaseAction implements ModelDriven<SearchHistory> {
	private static final long serialVersionUID = 1L;
	private SearchHistory searchHistory;
	private SearchHistoryService searchHistoryService;
	private Map<String, Object> books;
	public void setBooks(Map<String, Object> books) {
		this.books = books;
	}
	public Map<String, Object> getBooks() {
		return books;
	}
	public void setSearchHistoryService(SearchHistoryService searchHistoryService) {
		this.searchHistoryService = searchHistoryService;
	}

	public String searchBooks() {
		User tempUser = (User) session.get("user");
		if (tempUser != null && searchHistory != null) {
			searchHistory.setUser(tempUser);
		}
		request.put("status", 2);
		request.put("keyword", searchHistory.getKeyword());
		request.put("bookList", searchHistoryService.searchBooks(searchHistory));
		return "search";
	}
	public String bookSearch(){
		books = new HashMap<String,Object>();
		books.put("books", searchHistoryService.bookSearch(searchHistory));
		return "bookSearch";
	}
	public String checkSearchHistory(){
		User user=(User) session.get("user");
		if(user!=null){
			request.put("searchHistory", searchHistoryService.checkSearchHistory(user));
		}
		return "checkSearchHistory";
	}
	public void prepareBookSearch(){
		searchHistory = new SearchHistory();
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
