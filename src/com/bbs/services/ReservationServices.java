package com.bbs.services;

import java.util.List;

import com.bbs.dao.ReservationDao;
import com.bbs.entities.Reservation;
import com.bbs.entities.User;

public class ReservationServices {
	private ReservationDao reservationDao;

	public void setReservationDao(ReservationDao reservationDao) {
		this.reservationDao = reservationDao;
	}
	public void createReservation(Reservation reservation) {
		 reservationDao.createReservation(reservation);
	}
	
	public List<Reservation> checkReservationList(User user){
		return reservationDao.checkReservationList(user);
	}
}
