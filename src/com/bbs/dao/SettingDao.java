package com.bbs.dao;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.lucene.queryparser.classic.ParseException;

import com.bbs.entities.Book;
import com.bbs.entities.BookItem;
import com.bbs.entities.BorrowedRecord;
import com.bbs.entities.CreditHistory;
import com.bbs.entities.Reservation;
import com.bbs.entities.SearchHistory;
import com.bbs.entities.Settings;
import com.bbs.entities.User;
import com.bbs.entities.UserCredit;
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
			CreditHistory creditHistory = new CreditHistory();
			creditHistory.setCreateAt(new Date());
			creditHistory.setUserId(borrowedRecord.getUser().getUserId());
			creditHistory.setScore(-2);
			creditHistory.setOperation(4);
			getSession().save(creditHistory);
			String hql = "FROM UserCredit WHERE userId=" + borrowedRecord.getUser().getUserId();
			List<UserCredit> userCredits = getSession().createQuery(hql).list();
			UserCredit userCredit = null;
			if (userCredits.isEmpty()) {
				userCredit = new UserCredit();
				userCredit.setActiveDegree(50);
				userCredit.setCommentQulity(50);
				userCredit.setCredit(50);
				userCredit.setIdentity(50);
				userCredit.setUserId(borrowedRecord.getUser().getUserId());
				userCredit.setBehavior(50 - borrowedRecord.getBookItem().getBook().getBookCredit());
				userCredit.setOverAll(userCredit.getActiveDegree() + userCredit.getBehavior()
						+ userCredit.getCommentQulity() + userCredit.getCredit() + userCredit.getIdentity());
				getSession().save(userCredit);
			} else {
				userCredit = userCredits.get(0);
				if (userCredit.getBehavior() - borrowedRecord.getBookItem().getBook().getBookCredit() <= 0) {
					userCredit.setBehavior(0);
				} else {
					userCredit.setBehavior(
							userCredit.getBehavior() - borrowedRecord.getBookItem().getBook().getBookCredit());
				}
				userCredit.setOverAll(userCredit.getActiveDegree() + userCredit.getBehavior()
						+ userCredit.getCommentQulity() + userCredit.getCredit() + userCredit.getIdentity());
				getSession().update(userCredit);
			}
			calcuLevel(borrowedRecord.getUser(), userCredit.getOverAll());
			Book book = borrowedRecord.getBookItem().getBook();
			if (book.getBookCredit() > 0) {
				book.setBookCredit(book.getBookCredit() - 1);
			}
			getSession().update(book);
		}
	}

	public void changeReserveStatus(Reservation reservation) {
		if (reservation != null) {
			getSession().update(reservation);
			BookItem bookItem = reservation.getBookItem();
			CreditHistory creditHistory = new CreditHistory();
			creditHistory.setCreateAt(new Date());
			creditHistory.setUserId(reservation.getUser().getUserId());
			creditHistory.setScore(-2);
			creditHistory.setOperation(3);
			getSession().save(creditHistory);
			String hql = "FROM UserCredit WHERE userId=" + reservation.getUser().getUserId();
			List<UserCredit> userCredits = getSession().createQuery(hql).list();
			UserCredit userCredit = null;
			if (userCredits.isEmpty()) {
				userCredit = new UserCredit();
				userCredit.setActiveDegree(50);
				userCredit.setCommentQulity(50);
				userCredit.setCredit(50);
				userCredit.setIdentity(50);
				userCredit.setUserId(reservation.getUser().getUserId());
				userCredit.setBehavior(48);
				userCredit.setOverAll(userCredit.getActiveDegree() + userCredit.getBehavior()
						+ userCredit.getCommentQulity() + userCredit.getCredit() + userCredit.getIdentity());
				getSession().save(userCredit);
			} else {
				userCredit = userCredits.get(0);
				if (userCredit.getBehavior() - 2 <= 0) {
					userCredit.setBehavior(0);
				} else {
					userCredit.setBehavior(userCredit.getBehavior() - 2);
				}
				userCredit.setOverAll(userCredit.getActiveDegree() + userCredit.getBehavior()
						+ userCredit.getCommentQulity() + userCredit.getCredit() + userCredit.getIdentity());
				getSession().update(userCredit);
			}
			calcuLevel(reservation.getUser(), userCredit.getOverAll());
			bookItem.setStatus(0);
			Book book = bookItem.getBook();
			if (book.getBookCredit() > 0) {
				book.setBookCredit(book.getBookCredit() - 1);
			}
			getSession().update(book);
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

	private void calcuLevel(User user, int overall) {
		if (overall >= 475) {
			user.setLevel(10);
		} else if (overall >= 450) {
			user.setLevel(9);
		} else if (overall >= 425) {
			user.setLevel(8);
		} else if (overall >= 400) {
			user.setLevel(7);
		} else if (overall >= 375) {
			user.setLevel(6);
		} else if (overall >= 350) {
			user.setLevel(5);
		} else if (overall >= 325) {
			user.setLevel(4);
		} else if (overall >= 300) {
			user.setLevel(3);
		} else if (overall >= 275) {
			user.setLevel(2);
		} else if (overall >= 250) {
			user.setLevel(1);
		}
		getSession().update(user);
	}

}
