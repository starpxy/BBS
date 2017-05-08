package com.bbs.dao;

import com.bbs.entities.Reservation;

public class ReservationDao extends BaseDao{
	public void createReservation(Reservation reservation){
		getSession().saveOrUpdate(reservation);
	}
}
