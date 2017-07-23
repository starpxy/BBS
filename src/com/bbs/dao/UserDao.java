package com.bbs.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import com.bbs.entities.AccessLog;
import com.bbs.entities.Book;
import com.bbs.entities.BookItem;
import com.bbs.entities.BorrowedRecord;
import com.bbs.entities.Comment;
import com.bbs.entities.Reservation;
import com.bbs.entities.User;

public class UserDao extends BaseDao {
	public boolean login(User user) {
		if (user == null) {
			return false;
		}
		if (user.getPhoneNumber() == null && user.getWeChat() != null) {
			String hql = "FROM User WHERE weChat='" + user.getWeChat() + "'";
			List<Object> list = getSession().createQuery(hql).list();
			if (list.size() != 0) {
				return true;
			}
		}
		String hql = "FROM User WHERE phoneNumber='" + user.getPhoneNumber() + "' and password='" + user.getPassword()
				+ "'";
		List<Object> list = getSession().createQuery(hql).list();
		if (list.size() != 0) {
			return true;
		} else {
			return false;
		}
	}

	public void register(User user) {
		if (user.getPhoneNumber() != null && user.getWeChat() != null) {
			user.setUpdateAt(new Date());
			getSession().save(user);
		}
	}

	public User getInfo(User user) {
		String hql = "FROM User WHERE phoneNumber='" + user.getPhoneNumber() + "' and password='" + user.getPassword()
				+ "'";
		List<User> list = getSession().createQuery(hql).list();
		if (list.size() != 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

	public User getUserInfo(User user) {
		String hql = "FROM User WHERE userId=" + user.getUserId();
		List<User> list = getSession().createQuery(hql).list();
		if (list.size() != 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

	public void changePass(User user) {
		String hql = "FROM User WHERE userId=" + user.getUserId();
		User user2 = (User) getSession().createQuery(hql).list().get(0);
		user2.setPassword(user.getPassword());
		getSession().update(user2);
	}

	public void setRecomFreq(User user) {
		int frq = user.getRecommendFre();
		String hql = "FROM User WHERE userId=" + user.getUserId();
		User user2 = (User) getSession().createQuery(hql).list().get(0);
		user2.setRecommendFre(frq);
		getSession().update(user2);
	}

	public List<BorrowedRecord> payState(User user) {
		String hql = "FROM BorrowedRecord b LEFT OUTER JOIN FETCH b.user LEFT OUTER JOIN FETCH b.bookItem c LEFT OUTER JOIN FETCH c.book WHERE b.user.userId="
				+ user.getUserId() + " AND b.status=1";
		List<BorrowedRecord> list = (List<BorrowedRecord>) getSession().createQuery(hql).list();
		if (list.isEmpty()) {
			return null;
		} else {
			return list;
		}
	}

	public boolean adminLogin(User user) {
		String hql = "FROM User WHERE phoneNumber='" + user.getPhoneNumber() + "' AND password='" + user.getPassword()
				+ "' AND role='admin'";
		if (getSession().createQuery(hql).list().isEmpty()) {
			return false;
		} else {
			return true;
		}
	}

	public List<BookItem> adminInitial(int page) {
		String hql = "FROM BookItem b LEFT OUTER JOIN FETCH b.book";
		List<BookItem> bookItems = getSession().createQuery(hql).list();
		Iterator<BookItem> iterator = bookItems.iterator();
		BookItem buffer = null;
		List<BookItem> resultList = new ArrayList<BookItem>();
		int count = 0;
		while (iterator.hasNext()) {
			BookItem temp = iterator.next();
			if (buffer == null) {
				buffer = temp;
			}
			if (buffer.getBook().getBookId() == temp.getBook().getBookId() && count / 15 == (page - 1)) {
				resultList.add(temp);
			} else if (buffer.getBook().getBookId() != temp.getBook().getBookId()) {
				if (count / 15 == (page - 1)) {
					resultList.add(temp);
				}
				buffer = temp;
				count++;
			}
		}
		return resultList;
	}

	public List<User> adminUsers() {
		String hql = "FROM User";
		return getSession().createQuery(hql).list();
	}

	public List<BorrowedRecord> adminListRecords() {
		String hql = "FROM BorrowedRecord b LEFT OUTER JOIN FETCH b.user LEFT OUTER JOIN FETCH b.bookItem c LEFT OUTER JOIN FETCH c.book";
		List<BorrowedRecord> borrowedRecords = getSession().createQuery(hql).list();
		Collections.reverse(borrowedRecords);
		return borrowedRecords;
	}

	public List<Reservation> adminListReservations() {
		String hql = "FROM Reservation b LEFT OUTER JOIN FETCH b.user LEFT OUTER JOIN FETCH b.bookItem c LEFT OUTER JOIN FETCH c.book";
		List<Reservation> reservations = getSession().createQuery(hql).list();
		Collections.reverse(reservations);
		return reservations;
	}

	public List<Comment> adminListComments() {
		String hql = "FROM Comment b LEFT OUTER JOIN FETCH b.user LEFT OUTER JOIN FETCH b.book";
		List<Comment> comments = getSession().createQuery(hql).list();
		Collections.reverse(comments);
		return comments;
	}

	public void paySucceed(String outTradeNumber, String[] records) {
		for (int i = 0; i < records.length; i++) {
			String hql = "FROM BorrowedRecord b LEFT OUTER JOIN FETCH b.user LEFT OUTER JOIN FETCH b.bookItem c LEFT OUTER JOIN FETCH c.book WHERE b.borrowedId="
					+ records[i];
			List<BorrowedRecord> borrowedRecords = getSession().createQuery(hql).list();
			if (!borrowedRecords.isEmpty()) {
				BorrowedRecord borrowedRecord = borrowedRecords.get(0);
				borrowedRecord.setStatus(2);
				borrowedRecord.setOutTradeNo(outTradeNumber);
				borrowedRecord.setUpdateAt(new Date());
				getSession().update(borrowedRecord);
			}
		}
	}

	public User adminScanUser(String userId) {
		String hql = "FROM User WHERE userId=" + userId;
		List<User> users = getSession().createQuery(hql).list();
		if (users.isEmpty()) {
			return null;
		} else {
			return users.get(0);
		}
	}

	public List<BorrowedRecord> adminBorrow(String userId) {
		String hql = "FROM BorrowedRecord b LEFT OUTER JOIN FETCH b.user LEFT OUTER JOIN FETCH b.bookItem c LEFT OUTER JOIN FETCH c.book WHERE b.user.userId="
				+ userId + " AND b.status='unconfirmed'";
		return getSession().createQuery(hql).list();
	}

	public void adminConfirmBorrow(String[] ids) {
		for (int i = 0; i < ids.length; i++) {
			String hql = "FROM BorrowedRecord b LEFT OUTER JOIN FETCH b.user LEFT OUTER JOIN FETCH b.bookItem c LEFT OUTER JOIN FETCH c.book WHERE b.borrowedId="
					+ ids[i];
			List<BorrowedRecord> borrowedRecords = getSession().createQuery(hql).list();
			if (!borrowedRecords.isEmpty()) {
				BorrowedRecord borrowedRecord = borrowedRecords.get(0);
				borrowedRecord.setStatus(1);
				borrowedRecord.setUpdateAt(new Date());
				getSession().update(borrowedRecord);
			}
		}
	}

	public List<BorrowedRecord> adminReturn(String userId) {
		String hql = "FROM BorrowedRecord b LEFT OUTER JOIN FETCH b.user LEFT OUTER JOIN FETCH b.bookItem c LEFT OUTER JOIN FETCH c.book WHERE b.user.userId="
				+ userId + " AND b.status=2";
		return getSession().createQuery(hql).list();
	}

	public void adminConfirmReturn(String[] ids) {
		for (int i = 0; i < ids.length; i++) {
			String hql = "FROM BorrowedRecord b LEFT OUTER JOIN FETCH b.user LEFT OUTER JOIN FETCH b.bookItem c LEFT OUTER JOIN FETCH c.book WHERE b.borrowedId="
					+ ids[i];
			List<BorrowedRecord> borrowedRecords = getSession().createQuery(hql).list();
			if (!borrowedRecords.isEmpty()) {
				BorrowedRecord borrowedRecord = borrowedRecords.get(0);
				borrowedRecord.setStatus(3);
				borrowedRecord.setUpdateAt(new Date());
				getSession().update(borrowedRecord);
			}
		}
	}

	public void writeLog(AccessLog accessLog) {
		getSession().save(accessLog);
	}
}
