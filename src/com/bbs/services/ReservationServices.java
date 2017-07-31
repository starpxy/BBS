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

	public int createReservation(Reservation reservation, String bookId) {
		return reservationDao.createReservation(reservation, bookId);
	}

	public int addToWaitList(String bookId, User user) {
		return reservationDao.addToWaitList(bookId, user);
	}

	public List<Reservation> checkReservationList(User user) {
		return reservationDao.checkReservationList(user);
	}

	public List<Reservation> reservelist(User user) {
		return reservationDao.reservelist(user);
	}

	public int cancel(User user, String reservationId) {
		return reservationDao.cancel(user, reservationId);
	}
}
