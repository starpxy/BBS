package com.bbs.services;

import com.bbs.dao.ReservationDao;
import com.bbs.entities.Reservation;

public class ReservationServices {
	private ReservationDao reservationDao;

	public void setReservationDao(ReservationDao reservationDao) {
		this.reservationDao = reservationDao;
	}
	public void createReservation(Reservation reservation) {
		 reservationDao.createReservation(reservation);
	}
}
