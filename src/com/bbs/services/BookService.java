package com.bbs.services;

import java.util.List;

import com.bbs.dao.BookDao;
import com.bbs.entities.Book;
import com.bbs.entities.Comment;

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
	public List<Comment> showComments(Book book) {
		return bookDao.showComments(book);
	}


}
