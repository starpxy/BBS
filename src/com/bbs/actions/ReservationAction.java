package com.bbs.actions;


import com.bbs.entities.Reservation;
import com.bbs.entities.User;
import com.bbs.services.ReservationServices;
import com.opensymphony.xwork2.ModelDriven;

public class ReservationAction extends BaseAction implements ModelDriven<Reservation> {
	private static final long serialVersionUID = 1L;
	private ReservationServices reservationService;
	private Reservation reservation;
	public void setReservationService(ReservationServices reservationService) {
		this.reservationService = reservationService;
	}
	public String createReservation(Reservation reservation) {
		reservation.setUser((User) session.get("user"));
		reservationService.createReservation(reservation);
		request.put("reservation", reservation);
		return "reservation";
	}
	public void prepareCreateReservation() {
		reservation=new Reservation();
	}
	@Override
	public Reservation getModel() {
		return reservation;
	}
	

}
