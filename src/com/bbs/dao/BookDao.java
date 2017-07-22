package com.bbs.dao;

import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import com.bbs.entities.Book;
import com.bbs.entities.BookItem;
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

	public int addBookOld(String isbn) {
		String hql = "FROM Book WHERE isbn='" + isbn + "'";
		List<Book> list = getSession().createQuery(hql).list();
		if (list.isEmpty()) {
			return 2;
		} else {
			Book book = list.get(0);
			book.setBookVolume(book.getBookVolume() + 1);
			BookItem bookItem = new BookItem();
			bookItem.setBook(book);
			bookItem.setStatus(0);
			getSession().save(bookItem);
			return 1;
		}
	}
	public int addBookNew(Book book){
		String hql = "FROM Book WHERE isbn='"+book.getIsbn()+"'";
		Book newBook = null;
		if (book!=null&&!book.getIsbn().equals("")) {
			book.setBookVolume(1);
			book.setUpdateAt(new Date());
			getSession().save(book);
			List<Book> books = getSession().createQuery(hql).list();
			if (!books.isEmpty()) {
				newBook = books.get(0);
			}
		}
		if (newBook!=null) {
			BookItem bookItem = new BookItem();
			bookItem.setBook(newBook);
			bookItem.setStatus(0);
			getSession().save(bookItem);
			return 1;
		}
		else{
			return 2;
		}
	}
	public List<Book> bookList(Book book) {
		String type = book.getType();
		String hql = "FROM Book WHERE type='" + type + "'";
		List<Book> result = getSession().createQuery(hql).list();
		Iterator<Book> iterator = result.iterator();
		List<String> isbnTemp = new LinkedList<>();
		while(iterator.hasNext()){
			Book temp = iterator.next();
			if (isbnTemp.contains(temp.getIsbn())) {
				iterator.remove();
			}
			else{
				isbnTemp.add(temp.getIsbn());
			}
		}
		return result;
	}

	public List<Comment> showComments(Book book) {
		String hql = "FROM Comment WHERE book.bookId=" + book.getBookId();
		List<Comment> list = getSession().createQuery(hql).list();
		return list;
	}
}
