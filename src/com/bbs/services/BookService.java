package com.bbs.services;

import com.bbs.dao.BookDao;
import com.bbs.entities.Book;

public class BookService {
	BookDao bookDao;
	public void setBookDao(BookDao bookDao) {
		this.bookDao = bookDao;
	}
	public Book bookDetails(Book book) {
		return bookDao.bookDetails(book);
	}

}
