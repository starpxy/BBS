package com.bbs.dao;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import org.apache.lucene.queryparser.classic.ParseException;

import com.bbs.entities.Book;
import com.bbs.entities.SearchHistory;
import com.bbs.entities.User;
import com.bbs.search.Search;

public class SearchHistoryDao extends BaseDao {
	public List<Book> searchBooks(SearchHistory searchHistory) {
		Search search = new Search();
		String hql = "FROM Book";
		List<Book> list = getSession().createQuery(hql).list();
		List<Book> rankedBook = null;
		try {
			rankedBook = search.doSearch(list, searchHistory.getKeyword());
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String hql2 = "FROM User WHERE phoneNumber='"+searchHistory.getUser().getPhoneNumber()+"'";
		searchHistory.setUser((User)(getSession().createQuery(hql2).list().get(0)));
		searchHistory.setUpdateAt(new Date());
		/*
		 * 先加上注释，以后需要用的时候取消注释
		 */
//		getSession().saveOrUpdate(searchHistory);
		return rankedBook;
	}
	public List<Book> bookSearch(SearchHistory searchHistory) {
		Search search = new Search();
		String hql = "FROM Book";
		List<Book> list = getSession().createQuery(hql).list();
		List<Book> rankedBook = null;
		try {
			rankedBook = search.doSearch(list, searchHistory.getKeyword());
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return rankedBook;
	}
	public List<String> checkSearchHistory(User user) {
		List<String> history=null;
		String hql="FROM SearchHistory WHERE user.userId="+user.getUserId();
		history=getSession().createQuery(hql).list();
		return history;
	}

}
