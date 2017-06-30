package com.bbs.actions;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.bbs.api.TemplateMessagePushing;
import com.bbs.entities.Reservation;
import com.bbs.entities.User;
import com.bbs.services.ReservationServices;
import com.opensymphony.xwork2.ModelDriven;

public class ReservationAction extends BaseAction implements ModelDriven<Reservation>, ServletRequestAware {
	private static final long serialVersionUID = 1L;
	private ReservationServices reservationService;
	private Reservation reservation;
	private HttpServletRequest httpServletRequest;
	private Map<String, Object> reserveMap;

	public void setReserveMap(Map<String, Object> reserveMap) {
		this.reserveMap = reserveMap;
	}

	public Map<String, Object> getReserveMap() {
		return reserveMap;
	}

	public void setReservationService(ReservationServices reservationService) {
		this.reservationService = reservationService;
	}

	public String reserve() {
		Reservation reservation = new Reservation();
		reservation.setCreateAt(new Date());
		reservation.setUser((User) session.get("user"));
		int state = reservationService.createReservation(reservation, httpServletRequest.getParameter("bookId"));
		reserveMap = new HashMap<>();
		reserveMap.put("state", state);
		return "reserve";
	}

	public String templatePushing() {
		User user = (User) session.get("user");
		String bookTitle = httpServletRequest.getParameter("bookTitle");
		TemplateMessagePushing templateMessagePushing = new TemplateMessagePushing();
		templateMessagePushing.pushReservation(user.getWeChat(), bookTitle);
		return "pushed";
	}

	public String reservelist() {
		request.put("reservations", reservationService.reservelist((User) session.get("user")));
		return "reservelist";
	}

	public String cancel() {
		User user = (User) session.get("user");
		reserveMap = new HashMap<>();
		reserveMap.put("state", reservationService.cancel(user, httpServletRequest.getParameter("reservationId")));
		return "cancel";
	}

	public String checkReservationList() {
		User user = (User) session.get("user");
		if (user != null) {
			request.put("reservationList", reservationService.checkReservationList(user));
		}
		return "checkReservationList";
	}

	public void prepareCreateReservation() {
		reservation = new Reservation();
	}

	@Override
	public Reservation getModel() {
		return reservation;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		httpServletRequest = request;
	}

}
