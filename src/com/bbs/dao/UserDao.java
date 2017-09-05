package com.bbs.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;

import com.bbs.entities.AccessLog;
import com.bbs.entities.Book;
import com.bbs.entities.BookItem;
import com.bbs.entities.BorrowedRecord;
import com.bbs.entities.Comment;
import com.bbs.entities.CreditHistory;
import com.bbs.entities.ExtraInfo;
import com.bbs.entities.Favorite;
import com.bbs.entities.Reservation;
import com.bbs.entities.User;
import com.bbs.entities.UserCredit;

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

	public List<AccessLog> checkLogs(User user) {
		String hql = "FROM AccessLog b LEFT OUTER JOIN FETCH b.user WHERE b.user.userId=" + user.getUserId();
		return getSession().createQuery(hql).list();
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

	public List<CreditHistory> creditHistory(User user) {
		String hql = "FROM CreditHistory WHERE userId=" + user.getUserId();
		return getSession().createQuery(hql).list();
	}

	public UserCredit userCredit(User user) {
		String hql = "FROM UserCredit WHERE userId=" + user.getUserId();
		List<UserCredit> userCredits = (List<UserCredit>) getSession().createQuery(hql).list();
		if (userCredits.isEmpty()) {
			UserCredit userCredit = new UserCredit();
			userCredit.setUserId(user.getUserId());
			userCredit.setActiveDegree(50);
			userCredit.setBehavior(50);
			userCredit.setCommentQulity(50);
			userCredit.setCredit(50);
			userCredit.setIdentity(50);
			userCredit.setOverAll(250);
			getSession().save(userCredit);
			return userCredit;
		}
		return userCredits.get(0);
	}

	public ExtraInfo showExtraInfo(User user) {
		String hql = "FROM ExtraInfo WHERE userId=" + user.getUserId();
		List<ExtraInfo> extraInfos = getSession().createQuery(hql).list();
		if (extraInfos.isEmpty()) {
			return null;
		}
		return extraInfos.get(0);
	}

	public void saveExtraInfo(ExtraInfo extraInfo) {
		String hql = "FROM ExtraInfo WHERE userId=" + extraInfo.getUserId();
		List<ExtraInfo> extraInfos = getSession().createQuery(hql).list();
		if (extraInfos.isEmpty()) {
			increaseIdentity(extraInfo);
			getSession().save(extraInfo);
		} else {
			ExtraInfo temp = extraInfos.get(0);
			temp.setCompanyEmail(extraInfo.getCompanyEmail());
			temp.setSchool(extraInfo.getSchool());
			temp.setType(extraInfo.getType());
			increaseIdentity(extraInfo);
			getSession().update(temp);
		}
	}

	private void increaseIdentity(ExtraInfo extraInfo) {
		String hql = "FROM UserCredit WHERE userId=" + extraInfo.getUserId();
		List<UserCredit> userCredits = (List<UserCredit>) getSession().createQuery(hql).list();
		hql = "FROM User WHERE userId=" + extraInfo.getUserId();
		List<User> users = getSession().createQuery(hql).list();
		User user = null;
		if (!users.isEmpty()) {
			user = users.get(0);
		}
		if (!userCredits.isEmpty() && user != null) {
			UserCredit userCredit = userCredits.get(0);
			if (extraInfo.getType() == 1) {
				userCredit.setIdentity(80);
			} else {
				userCredit.setIdentity(70);
			}
			userCredit.setOverAll(userCredit.getActiveDegree() + userCredit.getBehavior()
					+ userCredit.getCommentQulity() + userCredit.getCredit() + userCredit.getIdentity());
			getSession().update(userCredit);
			calcuLevel(user, userCredit.getOverAll());
		}
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

	public int deleteReservation(String reservationId) {
		String hql = "FROM Reservation b LEFT OUTER JOIN FETCH b.user LEFT OUTER JOIN FETCH b.bookItem c LEFT OUTER JOIN FETCH c.book WHERE b.reservationId="
				+ reservationId;
		List<Reservation> reservations = getSession().createQuery(hql).list();
		if (reservations.isEmpty()) {
			return 3;
		}
		Reservation reservation = reservations.get(0);
		BookItem bookItem = reservation.getBookItem();
		bookItem.setStatus(0);
		getSession().update(bookItem);
		getSession().delete(reservation);
		return 1;
	}

	public List<BookItem> adminInitial(int page) {
		String hql = "FROM BookItem b LEFT OUTER JOIN FETCH b.book ORDER BY b.book.bookId ASC";
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
			if (buffer.getBook().getBookId() == temp.getBook().getBookId() && count / 14 == (page - 1)) {
				resultList.add(temp);
			} else if (buffer.getBook().getBookId() != temp.getBook().getBookId()) {
				if (count / 14 == (page - 1)) {
					resultList.add(temp);
				}
				buffer = temp;
				count++;
			}
		}
		return resultList;
	}

	public int getPages() {
		String hql = "FROM Book";
		List<Book> books = getSession().createQuery(hql).list();
		return (books.size() / 15) + 2;
	}

	public List<User> adminUsers() {
		String hql = "FROM User";
		return getSession().createQuery(hql).list();
	}

	public List<AccessLog> adminUsersArea() {
		String hql = "SELECT DISTINCT a.user, a.area FROM AccessLog a LEFT OUTER JOIN a.user";
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
				BookItem bookItem = borrowedRecord.getBookItem();
				bookItem.setStatus(3);
				getSession().update(bookItem);
				Book book = borrowedRecord.getBookItem().getBook();
				book.setBorrowedNum(book.getBorrowedNum() + 1);
				getSession().update(book);
				borrowedRecord.setStatus(2);
				borrowedRecord.setOutTradeNo(outTradeNumber);
				borrowedRecord.setUpdateAt(new Date());
				hql = "FROM UserCredit WHERE userId=" + borrowedRecord.getUser().getUserId();
				List<UserCredit> userCredits = getSession().createQuery(hql).list();
				UserCredit userCredit = null;
				if (userCredits.isEmpty()) {
					userCredit = new UserCredit();
					userCredit.setActiveDegree(50);
					userCredit.setCommentQulity(50);
					userCredit.setCredit(50);
					userCredit.setIdentity(50);
					userCredit.setUserId(borrowedRecord.getUser().getUserId());
					userCredit.setBehavior(52);
					userCredit.setOverAll(userCredit.getActiveDegree() + userCredit.getBehavior()
							+ userCredit.getCommentQulity() + userCredit.getCredit() + userCredit.getIdentity());
					getSession().save(userCredit);
				} else {
					userCredit = userCredits.get(0);
					if (userCredit.getBehavior() + 2 >= 100) {
						userCredit.setBehavior(100);
					} else {
						userCredit.setBehavior(userCredit.getBehavior() + 2);
					}
					userCredit.setOverAll(userCredit.getActiveDegree() + userCredit.getBehavior()
							+ userCredit.getCommentQulity() + userCredit.getCredit() + userCredit.getIdentity());
					getSession().update(userCredit);
				}
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
				+ userId + " AND b.status=0";
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
				Book book = borrowedRecord.getBookItem().getBook();
				book.setBookCredit(book.getBookCredit() + 1);
				getSession().update(book);
				getSession().update(borrowedRecord);
			}
		}
	}

	public int changeRole(String userId, String role) {
		String hql = "FROM User WHERE userId=" + userId;
		List<User> users = getSession().createQuery(hql).list();
		if (users.isEmpty()) {
			return 3;
		} else {
			User user = users.get(0);
			user.setRole(role);
			getSession().update(user);
			return 1;
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
				CreditHistory creditHistory = new CreditHistory();
				creditHistory.setCreateAt(new Date());
				creditHistory.setUserId(borrowedRecord.getUser().getUserId());
				creditHistory.setScore(2);
				creditHistory.setOperation(2);
				getSession().save(creditHistory);
				hql = "FROM UserCredit WHERE userId=" + borrowedRecord.getUser().getUserId();
				List<UserCredit> userCredits = getSession().createQuery(hql).list();
				UserCredit userCredit = null;
				if (userCredits.isEmpty()) {
					userCredit = new UserCredit();
					userCredit.setActiveDegree(50);
					userCredit.setCommentQulity(50);
					userCredit.setCredit(50);
					userCredit.setIdentity(50);
					userCredit.setUserId(borrowedRecord.getUser().getUserId());
					userCredit.setBehavior(50 + borrowedRecord.getBookItem().getBook().getBookCredit());
					userCredit.setOverAll(userCredit.getActiveDegree() + userCredit.getBehavior()
							+ userCredit.getCommentQulity() + userCredit.getCredit() + userCredit.getIdentity());
					getSession().save(userCredit);
				} else {
					userCredit = userCredits.get(0);
					if (userCredit.getBehavior() + borrowedRecord.getBookItem().getBook().getBookCredit() >= 100) {
						userCredit.setBehavior(100);
					} else {
						userCredit.setBehavior(
								userCredit.getBehavior() + borrowedRecord.getBookItem().getBook().getBookCredit());
					}
					userCredit.setOverAll(userCredit.getActiveDegree() + userCredit.getBehavior()
							+ userCredit.getCommentQulity() + userCredit.getCredit() + userCredit.getIdentity());
					getSession().update(userCredit);
				}
				calcuLevel(borrowedRecord.getUser(), userCredit.getOverAll());
				BookItem bookItem = borrowedRecord.getBookItem();
				bookItem.setStatus(0);
				Book book = bookItem.getBook();
				if (book.getBookCredit() > 0) {
					book.setBookCredit(book.getBookCredit() - 1);
				}
				getSession().update(book);
				getSession().update(bookItem);
				getSession().update(borrowedRecord);
			}
		}
	}

	public void changeSomething(User user) {
		if (user != null) {
			getSession().update(user);
		}
	}

	public void writeLog(AccessLog accessLog) {
		getSession().save(accessLog);
	}

	public int addToFavorite(User user, String bookId) {
		String hql = "FROM Favorite b LEFT OUTER JOIN FETCH b.user LEFT OUTER JOIN FETCH b.book WHERE b.user.userId="
				+ user.getUserId() + " AND b.book.bookId=" + bookId;
		if (!getSession().createQuery(hql).list().isEmpty()) {
			return 2;
		} else {
			Favorite favorite = new Favorite();
			favorite.setUser(user);
			hql = "FROM Book WHERE bookId=" + bookId;
			List<Book> books = getSession().createQuery(hql).list();
			if (books.isEmpty()) {
				return 3;
			}
			Book book = books.get(0);
			favorite.setBook(book);
			favorite.setUpdateAt(new Date());
			getSession().save(favorite);
			return 1;
		}
	}

	public Map<String, Object> creditInfo(User user) {
		Map<String, Object> result = new HashMap<>();
		String hql = "FROM CreditHistory WHERE userId=" + user.getUserId();
		List<CreditHistory> creditHistories = (List<CreditHistory>) getSession().createQuery(hql);
		hql = "FROM UserCredit WHERE userId=" + user.getUserId();
		List<UserCredit> userCredits = (List<UserCredit>) getSession().createQuery(hql);
		if (!userCredits.isEmpty()) {
			result.put("credit", userCredits.get(0));
		}
		result.put("history", creditHistories);
		return result;
	}

	public List<Favorite> myFavorites(User user) {
		String hql = "FROM Favorite f LEFT OUTER JOIN FETCH f.user LEFT OUTER JOIN FETCH f.book WHERE f.user.userId="
				+ user.getUserId();
		List<Favorite> favorites = getSession().createQuery(hql).list();
		return favorites;
	}

	public int deleteFavorite(User user, String bookId) {
		String hql = "FROM Favorite b LEFT OUTER JOIN FETCH b.user LEFT OUTER JOIN FETCH b.book WHERE b.user.userId="
				+ user.getUserId() + " AND b.book.bookId=" + bookId;
		List<Favorite> favorites = getSession().createQuery(hql).list();
		if (favorites.isEmpty()) {
			return 2;
		} else {
			getSession().delete(favorites.get(0));
			return 1;
		}
	}

	public int deleteAllFavorites(User user) {
		String hql = "FROM Favorite b LEFT OUTER JOIN FETCH b.user LEFT OUTER JOIN FETCH b.book WHERE b.user.userId="
				+ user.getUserId();
		List<Favorite> favorites = getSession().createQuery(hql).list();
		if (favorites.isEmpty()) {
			return 2;
		} else {
			Iterator<Favorite> iterator = favorites.iterator();
			while (iterator.hasNext()) {
				getSession().delete(iterator.next());
			}
			return 1;
		}
	}

	public List<AccessLog> adminShowInfo() {
		String hql = "FROM AccessLog a LEFT OUTER JOIN FETCH a.user ORDER BY a.id DESC";
		Query query = getSession().createQuery(hql);
		query.setMaxResults(15);
		List<AccessLog> accessLogs = query.list();
		return accessLogs;
	}

	public int addToSelected(String commentId) {
		String hql = "FROM Comment b LEFT OUTER JOIN FETCH b.user LEFT OUTER JOIN FETCH b.book WHERE b.commentId="
				+ commentId;
		List<Comment> comments = getSession().createQuery(hql).list();
		if (comments.isEmpty()) {
			return 3;
		} else {
			Comment comment = comments.get(0);
			comment.setStatus(1);
			getSession().update(comment);
			CreditHistory creditHistory = new CreditHistory();
			creditHistory.setCreateAt(new Date());
			creditHistory.setUserId(comment.getUser().getUserId());
			creditHistory.setScore(2);
			creditHistory.setOperation(1);
			getSession().save(creditHistory);
			hql = "FROM UserCredit WHERE userId=" + comment.getUser().getUserId();
			List<UserCredit> userCredits = getSession().createQuery(hql).list();
			UserCredit userCredit = null;
			if (userCredits.isEmpty()) {
				userCredit = new UserCredit();
				userCredit.setActiveDegree(52);
				userCredit.setCommentQulity(50);
				userCredit.setCredit(50);
				userCredit.setIdentity(50);
				userCredit.setUserId(comment.getUser().getUserId());
				userCredit.setBehavior(50);
				userCredit.setOverAll(userCredit.getActiveDegree() + userCredit.getBehavior()
						+ userCredit.getCommentQulity() + userCredit.getCredit() + userCredit.getIdentity());
				int overall = userCredit.getOverAll();
				calcuLevel(comment.getUser(), overall);
				getSession().save(userCredit);
			} else {
				userCredit = userCredits.get(0);
				if (userCredit.getCommentQulity() + 2 >= 100) {
					userCredit.setCommentQulity(100);
				} else {
					userCredit.setCommentQulity(userCredit.getCommentQulity() + 2);
				}
				userCredit.setOverAll(userCredit.getActiveDegree() + userCredit.getBehavior()
						+ userCredit.getCommentQulity() + userCredit.getCredit() + userCredit.getIdentity());
				getSession().update(userCredit);
				calcuLevel(comment.getUser(), userCredit.getOverAll());
			}
			return 1;
		}
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
