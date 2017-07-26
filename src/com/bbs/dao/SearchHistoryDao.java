package com.bbs.dao;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.lucene.queryparser.classic.ParseException;

import com.bbs.entities.Book;
import com.bbs.entities.SearchHistory;
import com.bbs.entities.User;
import com.bbs.search.Search;

public class SearchHistoryDao extends BaseDao {
	public List<Book> searchBooks(SearchHistory searchHistory,int page) {
		Search search = new Search();
		String hql = "FROM Book";
		List<Book> list = getSession().createQuery(hql).list();
		List<Book> result = new LinkedList<>();
		List<Book> rankedBook = null;
		try {
			rankedBook = search.doSearch(list, searchHistory.getKeyword());
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		if ((rankedBook.size()<=7&&page==1)) {
			String hql2 = "FROM User WHERE userId=" + searchHistory.getUser().getUserId();
			searchHistory.setUser((User) (getSession().createQuery(hql2).list().get(0)));
			searchHistory.setUpdateAt(new Date());
			getSession().save(searchHistory);
			return rankedBook;
		}
		int count = 1;
		Iterator<Book> iterator = rankedBook.iterator();
		while(iterator.hasNext()){
			Book temp = iterator.next();
			if (count/7==(page-1)) {
				result.add(temp);
			}
			count++;
		}
		String hql2 = "FROM User WHERE userId=" + searchHistory.getUser().getUserId();
		searchHistory.setUser((User) (getSession().createQuery(hql2).list().get(0)));
		searchHistory.setUpdateAt(new Date());
		getSession().save(searchHistory);
		return result;
	}

	public List<Book> bookSearch(SearchHistory searchHistory,int page) {
		Search search = new Search();
		String hql = "FROM Book";
		List<Book> list = getSession().createQuery(hql).list();
		List<Book> result = new LinkedList<>();
		List<Book> rankedBook = null;
		try {
			rankedBook = search.doSearch(list, searchHistory.getKeyword());
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		if ((rankedBook.size()<=7&&page==1)) {
			return rankedBook;
		}
		int count = 1;
		Iterator<Book> iterator = rankedBook.iterator();
		while(iterator.hasNext()){
			Book temp = iterator.next();
			if (count/7==(page-1)) {
				result.add(temp);
			}
			count++;
		}
		return result;
	}

	public List<String> checkSearchHistory(User user) {
		List<String> history = null;
		String hql = "FROM SearchHistory WHERE user.userId=" + user.getUserId();
		history = getSession().createQuery(hql).list();
		return history;
	}

	public Map<Book, List<Book>> recommendBook(User user) {
		String hql = "FROM SearchHistory WHERE user.userId="+user.getUserId();
		List<SearchHistory> searchHistories = getSession().createQuery(hql).list();
		Map<Book, List<Book>> result = new HashMap<>();
		if (!searchHistories.isEmpty()) {
			Iterator<SearchHistory> iterator = searchHistories.iterator();
			int count = 0;
			while(iterator.hasNext()&&count<5){
				SearchHistory searchHistory = iterator.next();
				hql = "FROM Book";
				List<Book> list = getSession().createQuery(hql).list();
				Search search = new Search();
				Book book = null;
				try {
					List<Book> tempBooks =  search.doSearch(list, searchHistory.getKeyword());
					if (tempBooks.isEmpty()) {
						continue;
					}
					else{
						book = search.doSearch(list, searchHistory.getKeyword()).get(0);
					}
				} catch (ParseException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				hql = "FROM Book WHERE type='"+book.getType()+"'";
				List<Book> booklist = getSession().createQuery(hql).list();
				result.put(book, booklist);
				count++;
			}
			return result;
		}
		else {
			return null;
		}
	}
}
