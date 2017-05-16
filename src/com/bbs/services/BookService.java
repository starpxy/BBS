package com.bbs.services;

import java.util.List;

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
	
	public List<Book> bookList(Book book) {
		return bookDao.bookList(book);
	}

}
