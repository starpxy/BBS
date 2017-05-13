package com.bbs.dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
			if(searchHistory==null){
				System.out.println("fucking asshole");
			}
			rankedBook = search.doSearch(list, searchHistory.getKeyword());
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String hql2 = "FROM User WHERE phoneNumber='"+searchHistory.getUser().getPhoneNumber()+"'";
		searchHistory.setUser((User)(getSession().createQuery(hql2).list().get(0)));
		System.out.println(searchHistory.getUser().getUserId());
		System.out.println(searchHistory.getUser().getPhoneNumber());
		searchHistory.setUpdateAt(new Date());
		getSession().saveOrUpdate(searchHistory);
		return rankedBook;
	}

}
