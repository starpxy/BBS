package com.bbs.admin.settings;

import java.util.TimerTask;

import com.bbs.entities.Settings;
import com.bbs.services.SettingService;

public class ReserveTask extends TimerTask{
	private long interval;
	private static int count = 0;
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
		System.out.println("reserve "+count);
		count++;
	}
}
