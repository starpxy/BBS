package com.bbs.dao;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.lucene.queryparser.classic.ParseException;

import com.bbs.entities.Book;
import com.bbs.entities.BookItem;
import com.bbs.entities.BorrowedRecord;
import com.bbs.entities.Reservation;
import com.bbs.entities.SearchHistory;
import com.bbs.entities.Settings;
import com.bbs.entities.User;
import com.bbs.entities.WaitList;
import com.bbs.search.Search;

public class SettingDao extends BaseDao {
	public Settings showSettings() {
		String hql = "FROM Settings";
		List<Settings> settings = getSession().createQuery(hql).list();
		if (settings.isEmpty()) {
			Settings setting = new Settings();
			getSession().save(setting);
			return setting;
		} else {
			return settings.get(0);
		}
	}

	public void update(Settings settings) {
		getSession().update(settings);
	}

	public List<BorrowedRecord> unreturnedRecords() {
		String hql = "FROM BorrowedRecord b LEFT OUTER JOIN FETCH b.user LEFT OUTER JOIN FETCH b.bookItem c LEFT OUTER JOIN FETCH c.book WHERE b.status=2";
		List<BorrowedRecord> borrowedRecords = getSession().createQuery(hql).list();
		return borrowedRecords;
	}

	public Map<Book, List<Book>> recommendBook(User user) {
		String hql = "FROM SearchHistory WHERE user.userId=" + user.getUserId();
		List<SearchHistory> searchHistories = getSession().createQuery(hql).list();
		Map<Book, List<Book>> result = new HashMap<>();
		if (!searchHistories.isEmpty()) {
			Iterator<SearchHistory> iterator = searchHistories.iterator();
			int count = 0;
			while (iterator.hasNext() && count < 5) {
				SearchHistory searchHistory = iterator.next();
				hql = "FROM Book";
				List<Book> list = getSession().createQuery(hql).list();
				Search search = new Search();
				Book book = null;
				try {
					List<Book> tempBooks = search.doSearch(list, searchHistory.getKeyword());
					if (tempBooks.isEmpty()) {
						continue;
					} else {
						book = search.doSearch(list, searchHistory.getKeyword()).get(0);
					}
				} catch (ParseException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				hql = "FROM Book WHERE type='" + book.getType() + "'";
				List<Book> booklist = getSession().createQuery(hql).list();
				result.put(book, booklist);
				count++;
			}
			return result;
		} else {
			return null;
		}
	}

	public List<User> selectUsers() {
		String hql = "FROM User";
		return getSession().createQuery(hql).list();
	}

	public List<WaitList> showWaitList() {
		String hql = "FROM WaitList w LEFT OUTER JOIN FETCH w.user LEFT OUTER JOIN FETCH w.book";
		return getSession().createQuery(hql).list();
	}

	public void saveUser(User user) {
		if (user != null && user.getUserId() != null) {
			getSession().update(user);
		}
	}

	public boolean isBookAva(Book book) {
		String hql = "FROM BookItem b WHERE b.book.bookId=" + book.getBookId() + " AND b.status=0";
		List<Book> list = getSession().createQuery(hql).list();
		if (list.isEmpty()) {
			return false;
		} else {
			return true;
		}
	}

	public void changeWaitStatus(WaitList waitList) {
		if (waitList != null) {
			getSession().update(waitList);
		}
	}

	public void changeRecordStatus(BorrowedRecord borrowedRecord) {
		if (borrowedRecord != null) {
			getSession().update(borrowedRecord);
		}
	}

	public void changeReserveStatus(Reservation reservation) {
		if (reservation != null) {
			getSession().update(reservation);
			BookItem bookItem = reservation.getBookItem();
			bookItem.setStatus(0);
			getSession().update(bookItem);
		}
	}

	public List<Reservation> showReservations() {
		String hql = "FROM Reservation b LEFT OUTER JOIN FETCH b.user LEFT OUTER JOIN FETCH b.bookItem c LEFT OUTER JOIN FETCH c.book WHERE b.status=0";
		return getSession().createQuery(hql).list();
	}

	public List<BorrowedRecord> showRecordsToReturn() {
		String hql = "FROM BorrowedRecord b LEFT OUTER JOIN FETCH b.user LEFT OUTER JOIN FETCH b.bookItem c LEFT OUTER JOIN FETCH c.book WHERE b.status=3";
		return getSession().createQuery(hql).list();
	}

}
