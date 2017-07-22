package com.bbs.dao;

import java.util.Date;
import java.util.List;

import com.bbs.api.TemplateMessagePushing;
import com.bbs.converters.TimeUtils;
import com.bbs.entities.Book;
import com.bbs.entities.BookItem;
import com.bbs.entities.BorrowedRecord;
import com.bbs.entities.Reservation;
import com.bbs.entities.User;

public class BorrowedRecordDao extends BaseDao {
	public List<BorrowedRecord> checkBorrowedRecord(User user) {
		List<BorrowedRecord> records = null;
		String hql = "FROM BorrowedRecord WHERE user.userId=" + user.getUserId() + " AND status<>0";
		records = getSession().createQuery(hql).list();
		return records;
	}

	public int createRecord(BorrowedRecord borrowedRecord) {
		String hql = "FROM BookItem WHERE itemId=" + borrowedRecord.getBookItem().getItemId()
				+ " AND status=0";
		List<BookItem> bookItems = getSession().createQuery(hql).list();
		hql = "FROM BorrowedRecord WHERE user.userId=" + borrowedRecord.getUser().getUserId()
				+ " AND status=0";
		List<BorrowedRecord> borrowedRecords = getSession().createQuery(hql).list();
		hql = "FROM Reservation WHERE user.userId=" + borrowedRecord.getUser().getUserId() + " AND status=0";
		List<Reservation> reservations = getSession().createQuery(hql).list();
		if (bookItems.isEmpty()) {
			return 0;
		} else if (borrowedRecords.size() >= 2) {
			return 1;
		} else {
			BookItem bookItem = bookItems.get(0);
			hql = "FROM Book WHERE bookId=" + bookItem.getBook().getBookId();
			Book book = (Book) getSession().createQuery(hql).list().get(0);
			bookItem.setBook(book);
			borrowedRecord.setBookItem(bookItem);
			borrowedRecord.setOutTradeNo(null);
			hql = "FROM User WHERE userId=" + borrowedRecord.getUser().getUserId();
			User user = (User) getSession().createQuery(hql).list().get(0);
			borrowedRecord.setUser(user);
			bookItem.setStatus("已添加借书单");
			if (!reservations.isEmpty()) {
				Reservation reservation = reservations.get(0);
				reservation.setStatus(2);
				getSession().update(reservation);
			}
			getSession().update(bookItem);
			getSession().save(borrowedRecord);
			return 2;
		}
	}

	public boolean returnRemaining(String userId, String borrowedId) {
		String hql = "FROM BorrowedRecord b LEFT OUTER JOIN FETCH b.user LEFT OUTER JOIN FETCH b.bookItem c LEFT OUTER JOIN FETCH c.book WHERE b.borrowedId="
				+ borrowedId + " AND b.user.userId=" + userId + " AND b.status=2";
		List<BorrowedRecord> borrowedRecords = getSession().createQuery(hql).list();
		if (borrowedRecords.isEmpty()) {
			return false;
		} else {
			BorrowedRecord borrowedRecord = borrowedRecords.get(0);
			TemplateMessagePushing templateMessagePushing = new TemplateMessagePushing();
			String bookTitle = borrowedRecord.getBookItem().getBook().getBookTitle();
			String openId = borrowedRecord.getUser().getWeChat();
			int days = (int) TimeUtils.calTimeDiff(new Date(), borrowedRecord.getBorrowedAt().toString().substring(0,
					borrowedRecord.getBorrowedAt().toString().length() - 2));
			if (days <= 0) {
				return false;
			}
			templateMessagePushing.pushReturningBooks(openId, bookTitle, days);
			return true;
		}
	}

	public List<BorrowedRecord> borrowlist(User user) {
		String hql = "FROM BorrowedRecord b LEFT OUTER JOIN FETCH b.user LEFT OUTER JOIN FETCH b.bookItem c LEFT OUTER JOIN FETCH c.book WHERE b.user.userId="
				+ user.getUserId() + " AND b.status=0";
		List<BorrowedRecord> borrowedRecords = getSession().createQuery(hql).list();
		return borrowedRecords;
	}
	public int cancel(User user,String recordId){
		String hql = "FROM BorrowedRecord b LEFT OUTER JOIN FETCH b.user LEFT OUTER JOIN FETCH b.bookItem c LEFT OUTER JOIN FETCH c.book WHERE b.borrowedId="+recordId;
		List<BorrowedRecord> borrowedRecords = getSession().createQuery(hql).list();
		if (!borrowedRecords.isEmpty()) {
			BorrowedRecord borrowedRecord = borrowedRecords.get(0);
			if (borrowedRecord.getUser().getUserId()==user.getUserId()) {
				if (borrowedRecord.getStatus()==0) {
					BookItem bookItem = borrowedRecord.getBookItem();
					bookItem.setStatus("可借阅");
					getSession().update(bookItem);
					getSession().delete(borrowedRecord);
					return 1;
				}
				else{
					return 4;
				}
			}
			else{
				return 2;
			}
		}
		else{
			return 3;
		}
	}
	public List<BorrowedRecord> borrowHistory(User user){
		String hql = "FROM BorrowedRecord b LEFT OUTER JOIN FETCH b.user LEFT OUTER JOIN FETCH b.bookItem c LEFT OUTER JOIN FETCH c.book WHERE b.userId="+user.getUserId();
		return getSession().createQuery(hql).list();
	}
}
