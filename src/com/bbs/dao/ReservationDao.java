package com.bbs.dao;

import java.util.Date;

import com.bbs.entities.Reservation;
import com.bbs.entities.User;

public class ReservationDao extends BaseDao{
	public void createReservation(Reservation reservation){
		reservation.setCreateAt(new Date());
		reservation.setUpdateAt(new Date());
		User user = reservation.getUser();
		if (user!=null) {
			user.getReservations().add(reservation);
		}
		getSession().saveOrUpdate(reservation);
	}
}
