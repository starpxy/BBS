package com.bbs.dao;

import java.util.List;

import com.bbs.entities.Book;
import com.bbs.entities.Comment;

public class BookDao extends BaseDao {
	public Book bookDetails(Book book) {
		String hql = "FROM Book WHERE bookId=" + book.getBookId();
		Book newBook = null;
		if (book.getBookId() != null) {
			newBook = (Book) getSession().createQuery(hql).list().get(0);
		} else {
			System.out.println("empty bookID");
		}
		return newBook;

	}

	public List<Book> bookList(Book book) {
		String type = book.getType();
		String hql = "FROM Book WHERE type='" + type + "'";
		return getSession().createQuery(hql).list();
	}

	public List<Comment> showComments(Book book) {
		String hql = "FROM Comment WHERE book.bookId="+book.getBookId();
		List<Comment> list = getSession().createQuery(hql).list();
		return list;
	}
}
