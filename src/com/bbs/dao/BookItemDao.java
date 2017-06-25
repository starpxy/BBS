package com.bbs.dao;

import java.util.List;

import com.bbs.entities.BookItem;
import com.bbs.entities.Reservation;
import com.bbs.entities.User;

public class BookItemDao extends BaseDao {
	public int ava(BookItem bookItem,User user){
		String hql = "FROM BookItem WHERE itemId="+bookItem.getItemId();
		List<BookItem> bookItems = getSession().createQuery(hql).list();
		hql = "FROM Reservation WHERE user.userId="+user.getUserId()+" AND bookItem.itemId="+bookItem.getItemId()+" AND status='reserved'";
		List<Reservation> reservations = getSession().createQuery(hql).list();
		if (reservations.isEmpty()) {
			if (bookItems.isEmpty()) {
				return 4;
			}
			else {
				BookItem bookItem2 = bookItems.get(0);
				if (bookItem2.getStatus().equals("reserved")) {
					return 2;
				}
				else{
					return 1;
				}
			}
		}
		else {
			Reservation reservation = reservations.get(0);
			if (reservation.getBookItem().getItemId()==bookItem.getItemId()) {
				return 1;
			}
			else{
				return 3;
			}
		}
	}
}
