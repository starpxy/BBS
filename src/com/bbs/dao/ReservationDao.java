package com.bbs.dao;

import java.util.Date;
import java.util.List;

import com.bbs.api.TemplateMessagePushing;
import com.bbs.entities.BookItem;
import com.bbs.entities.BorrowedRecord;
import com.bbs.entities.Reservation;
import com.bbs.entities.User;

public class ReservationDao extends BaseDao{
	public int createReservation(Reservation reservation,String bookId){
		String hql = "FROM BookItem b LEFT OUTER JOIN FETCH b.book WHERE b.book.bookId="+bookId+" AND b.status='available'";
		List<BookItem> bookItems = getSession().createQuery(hql).list();
		hql = "FROM Reservation b LEFT OUTER JOIN FETCH b.user LEFT OUTER JOIN FETCH b.bookItem c LEFT OUTER JOIN FETCH c.book WHERE b.user.userId="+reservation.getUser().getUserId()+" AND b.status='reserved'";
		List<Reservation> reservations = getSession().createQuery(hql).list();
		if (bookItems.isEmpty()) {
			return 2;
		}
		else if (reservations.size()>=2) {
			return 3;
		}
		else{
			BookItem bookItem = bookItems.get(0);
			bookItem.setStatus("reserved");
			reservation.setBookItem(bookItem);
			reservation.setStatus("reserved");
			reservation.setUpdateAt(new Date());
			getSession().update(bookItem);
			getSession().save(reservation);
			return 1;
		}
	}
	
	public List<Reservation> checkReservationList(User user){
		List<Reservation> reservations=null;
		String hql="FROM Reservation WHERE user.userId="+user.getUserId();
		reservations=getSession().createQuery(hql).list();
		return reservations;
	}
	public List<Reservation> reservelist(User user){
		String hql = "FROM Reservation b LEFT OUTER JOIN FETCH b.user LEFT OUTER JOIN FETCH b.bookItem c LEFT OUTER JOIN FETCH c.book WHERE b.user.userId="+user.getUserId()+" AND b.status='reserved'";
		List<Reservation> reservations = getSession().createQuery(hql).list();
		return reservations;
	}
	public int cancel(User user,String reservationId){
		String hql = "FROM Reservation b LEFT OUTER JOIN FETCH b.user LEFT OUTER JOIN FETCH b.bookItem c LEFT OUTER JOIN FETCH c.book WHERE b.reservationId="+reservationId;
		List<Reservation> reservations = getSession().createQuery(hql).list();
		if (!reservations.isEmpty()) {
			Reservation reservation = reservations.get(0);
			if (reservation.getUser().getUserId()==user.getUserId()) {
				if (reservation.getStatus().equals("reserved")) {
					BookItem bookItem = reservation.getBookItem();
					bookItem.setStatus("available");
					getSession().update(bookItem);
					getSession().delete(reservation);
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
}
