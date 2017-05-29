package com.bbs.dao;

import java.util.Date;
import java.util.List;

import com.bbs.entities.Reservation;
import com.bbs.entities.User;

public class ReservationDao extends BaseDao{
	public void createReservation(Reservation reservation){

	}
	
	public List<Reservation> checkReservationList(User user){
		List<Reservation> reservations=null;
		String hql="FROM Reservation WHERE user.userId="+user.getUserId();
		reservations=getSession().createQuery(hql).list();
		return reservations;
	}
}
