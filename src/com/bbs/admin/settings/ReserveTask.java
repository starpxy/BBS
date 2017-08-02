package com.bbs.admin.settings;

import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.TimerTask;

import com.bbs.api.TemplateMessagePushing;
import com.bbs.entities.Book;
import com.bbs.entities.BookItem;
import com.bbs.entities.Reservation;
import com.bbs.entities.Settings;
import com.bbs.entities.User;
import com.bbs.services.SettingService;

public class ReserveTask extends TimerTask {
	private long interval;
	private SettingService settingService;
	private static ReserveTask reserveTask;

	private ReserveTask() {
		super();
	}

	public static ReserveTask getInstance() {
		if (reserveTask == null || !reserveTask.cancel()) {
			reserveTask = new ReserveTask();
			return reserveTask;
		} else {
			return reserveTask;
		}
	}

	public static ReserveTask getInstance(SettingService settingService, long interval) {
		if (reserveTask == null || !reserveTask.cancel()) {
			reserveTask = new ReserveTask(settingService, interval);
			return reserveTask;
		} else {
			return reserveTask;
		}
	}

	public void setSettingService(SettingService settingService) {
		this.settingService = settingService;
	}

	public void setInterval(long interval) {
		this.interval = interval;
	}

	public void cancelTask() {
		reserveTask.cancel();
		Settings settings = settingService.showSettings();
		settings.setReserveOverdue(0);
		settingService.update(settings);
	}

	private ReserveTask(SettingService settingService, long interval) {
		super();
		this.interval = interval;
		this.settingService = settingService;
	}

	@Override
	public void run() {
		List<Reservation> reservations = settingService.showReservations();
		Iterator<Reservation> iterator = reservations.iterator();
		while (iterator.hasNext()) {
			Reservation reservation = iterator.next();
			Long time = new Date().getTime();
			if (time > reservation.getFetchDate().getTime()) {
				User user = reservation.getUser();
				Book book = reservation.getBookItem().getBook();
				TemplateMessagePushing templateMessagePushing = new TemplateMessagePushing();
				templateMessagePushing.pushReserveOverdue(user, book);
				reservation.setStatus(1);
				settingService.changeReservationStatus(reservation);
			}
		}
	}
}
