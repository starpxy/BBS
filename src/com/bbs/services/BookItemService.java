package com.bbs.services;

import com.bbs.dao.BookItemDao;
import com.bbs.entities.BookItem;
import com.bbs.entities.User;

public class BookItemService {
	private BookItemDao bookItemDao;

	public void setBookItemDao(BookItemDao bookItemDao) {
		this.bookItemDao = bookItemDao;
	}

	public BookItemDao getBookItemDao() {
		return bookItemDao;
	}
	public int ava(BookItem bookItem,User user){
		return bookItemDao.ava(bookItem,user);
	}
}
