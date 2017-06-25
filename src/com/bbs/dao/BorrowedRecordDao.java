package com.bbs.dao;

import java.util.List;

import com.bbs.entities.Book;
import com.bbs.entities.BookItem;
import com.bbs.entities.BorrowedRecord;
import com.bbs.entities.Reservation;
import com.bbs.entities.User;

public class BorrowedRecordDao extends BaseDao{
	public List<BorrowedRecord> checkBorrowedRecord(User user) {
		List<BorrowedRecord> records=null;
		String hql="FROM BorrowedRecord WHERE user.userId="+user.getUserId()+" AND status<>'unconfirmed'";
		records=getSession().createQuery(hql).list();
		return records;
	}
	public List<BorrowedRecord> borrowlist(User user) {
		List<BorrowedRecord> records=null;
		String hql="FROM BorrowedRecord WHERE user.userId="+user.getUserId()+" AND status='ready'";
		records=getSession().createQuery(hql).list();
		return records;
	}
	public int createRecord(BorrowedRecord borrowedRecord){
		String hql = "FROM BookItem WHERE itemId="+borrowedRecord.getBookItem().getItemId()+" AND status='available'";
		List<BookItem> bookItems = getSession().createQuery(hql).list();
		hql = "FROM BorrowedRecord WHERE user.userId="+borrowedRecord.getUser().getUserId()+" AND status='unconfirmed'";
		List<BorrowedRecord> borrowedRecords = getSession().createQuery(hql).list();
		hql = "FROM Reservation WHERE user.userId="+borrowedRecord.getUser().getUserId()+" AND status='reserved'";
		List<Reservation> reservations = getSession().createQuery(hql).list();
		if (bookItems.isEmpty()) {
			return 0;
		}
		else if (borrowedRecords.size()>=2) {
			return 1;
		}
		else {
			BookItem bookItem = bookItems.get(0);
			hql = "FROM Book WHERE bookId="+bookItem.getBook().getBookId();
			Book book = (Book) getSession().createQuery(hql).list().get(0);
			bookItem.setBook(book);
			borrowedRecord.setBookItem(bookItem);
			borrowedRecord.setOutTradeNo(null);
			hql = "FROM User WHERE userId="+borrowedRecord.getUser().getUserId();
			User user = (User)getSession().createQuery(hql).list().get(0);
			borrowedRecord.setUser(user);
			bookItem.setStatus("ready");
			if (!reservations.isEmpty()) {
				Reservation reservation = reservations.get(0);
				reservation.setStatus("borrowed");
				getSession().update(reservation);
			}
			getSession().update(bookItem);
			getSession().save(borrowedRecord);
			return 2;
		}
	}
}
