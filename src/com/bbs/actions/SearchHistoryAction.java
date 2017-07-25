package com.bbs.actions;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.bbs.entities.Book;
import com.bbs.entities.SearchHistory;
import com.bbs.entities.User;
import com.bbs.recommend.RankAlgorithm;
import com.bbs.services.SearchHistoryService;
import com.opensymphony.xwork2.ModelDriven;

import net.sf.json.JSONArray;

public class SearchHistoryAction extends BaseAction implements ModelDriven<SearchHistory> ,ServletRequestAware{
	private static final long serialVersionUID = 1L;
	private SearchHistory searchHistory;
	private SearchHistoryService searchHistoryService;
	private Map<String, Object> books;
	private HttpServletRequest httpServletRequest;
	public void setBooks(Map<String, Object> books) {
		this.books = books;
	}
	public Map<String, Object> getBooks() {
		return books;
	}
	public void setSearchHistoryService(SearchHistoryService searchHistoryService) {
		this.searchHistoryService = searchHistoryService;
	}
	
	public String recommendBook() throws IOException{
		User user = (User) session.get("user");
		Map<Book, List<Book>> tempBooks = searchHistoryService.recommendBook(user);
		if (tempBooks==null) {
			books = new HashMap<>();
			books.put("state", 2);
			return "bookSearch";
		}
		List<Book> historyBooks = new LinkedList<>();
		List<List<Book>> listBook = new LinkedList<>();
		Iterator<Book> iterator = tempBooks.keySet().iterator();
		while(iterator.hasNext()){
			Book temp = iterator.next();
			historyBooks.add(temp);
			listBook.add(tempBooks.get(temp));
		}
		List<Entry<Book, Double>> temp = RankAlgorithm.getRecomBookList(historyBooks, listBook);
		List<Book> result = new LinkedList<>();
		for (Entry<Book, Double> entry : temp) {
			result.add(entry.getKey());
		}
		books = new HashMap<>();
		books.put("state", 1);
		books.put("books", JSONArray.fromObject(result));
		return "bookSearch";
	}
	public String searchBooks() {
		User tempUser = (User) session.get("user");
		if (tempUser != null && searchHistory != null) {
			searchHistory.setUser(tempUser);
		}
		String p = httpServletRequest.getParameter("page");
		int page = 1;
		if (p!=null) {
			page = Integer.valueOf(p);
		}
		request.put("status", 2);
		request.put("keyword", searchHistory.getKeyword());
		request.put("bookList", searchHistoryService.searchBooks(searchHistory,page));
		return "search";
	}
	public String bookSearch(){
		User tempUser = (User) session.get("user");
		if (tempUser != null && searchHistory != null) {
			searchHistory.setUser(tempUser);
		}
		String p = httpServletRequest.getParameter("page");
		int page = 1;
		if (p!=null) {
			page = Integer.valueOf(p);
		}
		books = new HashMap<String,Object>();
		books.put("books", searchHistoryService.bookSearch(searchHistory,page));
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
		return searchHistory;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		httpServletRequest = request;
	}

}
