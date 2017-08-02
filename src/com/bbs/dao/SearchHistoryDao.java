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
	
	public List<Book> recommend(List<Integer> ids){
		List<Book> result = new LinkedList<>();
		Iterator<Integer> iterator = ids.iterator();
		while(iterator.hasNext()){
			int i = iterator.next();
			String hql = "FROM Book WHERE bookId="+i;
			List<Book> books = getSession().createQuery(hql).list();
			if (!books.isEmpty()) {
				result.add(books.get(0));
			}
		}
		return result;
	}

}
