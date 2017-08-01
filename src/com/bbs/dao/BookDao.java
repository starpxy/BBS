package com.bbs.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import com.bbs.entities.Book;
import com.bbs.entities.BookItem;
import com.bbs.entities.Comment;
import com.bbs.entities.Favorite;
import com.bbs.entities.User;

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

	public int isBookFavorited(User user, String bookId) {
		String hql = "FROM Favorite b LEFT JOIN FETCH b.user LEFT JOIN FETCH b.book WHERE b.user.userId=" + user.getUserId() + " AND b.book.bookId="
				+ bookId;
		List<Favorite> favorites = getSession().createQuery(hql).list();
		if (favorites.isEmpty()) {
			return 2;
		} else {
			return 1;
		}
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

	public int addBookNew(Book book) {
		String hql = "FROM Book WHERE isbn='" + book.getIsbn() + "'";
		Book newBook = null;
		if (book != null && !book.getIsbn().equals("")) {
			book.setBookVolume(1);
			book.setUpdateAt(new Date());
			getSession().save(book);
			List<Book> books = getSession().createQuery(hql).list();
			if (!books.isEmpty()) {
				newBook = books.get(0);
			}
		}
		if (newBook != null) {
			BookItem bookItem = new BookItem();
			bookItem.setBook(newBook);
			bookItem.setStatus(0);
			getSession().save(bookItem);
			return 1;
		} else {
			return 2;
		}
	}

	public List<Book> bookList(Book book, int page) {
		String type = book.getType();
		String hql = "FROM Book WHERE type='" + type + "'";
		List<Book> books = getSession().createQuery(hql).list();
		if (page == -1 || (page == 1 && books.size() <= 7)) {
			return books;
		}
		List<Book> result = new LinkedList<>();
		Iterator<Book> iterator = books.iterator();
		int count = 1;
		while (iterator.hasNext()) {
			Book temp = iterator.next();
			if (count / 7 == (page - 1)) {
				result.add(temp);
			}
			count++;
		}
		return result;
	}

	public List<Comment> showComments(Book book) {
		String hql = "FROM Comment WHERE book.bookId=" + book.getBookId();
		List<Comment> list = getSession().createQuery(hql).list();
		return list;
	}

	public int update(Book book) {
		String hql = "FROM Book WHERE bookId=" + book.getBookId();
		List<Book> books = getSession().createQuery(hql).list();
		if (books.isEmpty()) {
			return 2;
		} else {
			Book book2 = books.get(0);
			book2.setBookTitle(book.getBookTitle());
			book2.setBookTitle(book.getBookTitle());
			book2.setAuthor(book.getAuthor());
			book2.setDirectory(book.getDirectory());
			book2.setIntroduction(book.getIntroduction());
			book2.setSimpleChart(book.getSimpleChart());
			book2.setPreface(book.getPreface());
			book2.setPrice(book.getPrice());
			book2.setPublisher(book.getPublisher());
			book2.setVersionNumber(book.getVersionNumber());
			getSession().update(book2);
			return 1;
		}
	}

	public Map<Integer, Date> getBookList() {
		String hql = "FROM Book";
		List<Book> books = getSession().createQuery(hql).list();
		Iterator<Book> iterator = books.iterator();
		Map<Integer, Date> map = new HashMap<>();
		while(iterator.hasNext()){
			Book book = iterator.next();
			map.put(book.getBookId(), book.getUpdateAt());
		}
		return map;
	}
}
